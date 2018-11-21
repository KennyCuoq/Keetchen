import jsQR from "jsqr";
import swal from 'sweetalert';

function activeJSQR() {
  var currentActive = false;
  var video = document.createElement("video");
  var canvasElement = document.getElementById("canvas");
  var canvas = canvasElement.getContext("2d");
  var loadingMessage = document.getElementById("loadingMessage");
  var outputContainer = document.getElementById("output");
  var outputMessage = document.getElementById("outputMessage");
  var outputData = document.getElementById("outputData");

  function drawLine(begin, end, color) {
    canvas.beginPath();
    canvas.moveTo(begin.x, begin.y);
    canvas.lineTo(end.x, end.y);
    canvas.lineWidth = 4;
    canvas.strokeStyle = color;
    canvas.stroke();
  }

  // Use facingMode: environment to attemt to get the front camera on phones
  navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function(stream) {
    video.srcObject = stream;
    video.setAttribute("playsinline", true); // required to tell iOS safari we don't want fullscreen
    video.play();
    requestAnimationFrame(tick);
  });

  function tick() {
    loadingMessage.innerText = "⌛ Loading video..."
    if (video.readyState === video.HAVE_ENOUGH_DATA) {
      loadingMessage.hidden = true;
      canvasElement.hidden = false;
      outputContainer.hidden = false;

      canvasElement.height = video.videoHeight;
      canvasElement.width = video.videoWidth;
      canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
      var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
      var code = jsQR(imageData.data, imageData.width, imageData.height, {
        inversionAttempts: "dontInvert",
      });
      if (code) {
        drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF3B58");
        drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF3B58");
        drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF3B58");
        drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF3B58");
        outputMessage.hidden = true;
        outputData.parentElement.hidden = false;
        outputData.innerText = code.data;
        if (code.data) {
          if (!currentActive) {
            currentActive = true
            launchRequest(code.data);
          }
          // showRequestOrderDetails();
        }
      } else {
        outputMessage.hidden = false;
        outputData.parentElement.hidden = true;
      }
    }
    requestAnimationFrame(tick);
  }
}

function launchRequest(data) {
  console.log("called")
  // make ajax call to confirm booking,
  fetch("/confirm_order", {
    method: "POST",
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': Rails.csrfToken()
    },
    body: JSON.stringify({
      qr: data
    })
  })
  .then(response => {
    activeJSQR.currentActive = false;
    return response.json()
  })
  .then((data) => {
    console.log(data.msg);
    if (data.msg === "No record") {
      document.querySelector(".qr-content").innerHTML = "This QR code is not valid";
      document.querySelector(".qr-name").innerHTML = "No data available";
      document.querySelector(".qr-quantity").innerHTML = "No data available";
      document.querySelector(".qr-date").innerHTML = "No data available";
      document.querySelector(".qr-meal").innerHTML = "No data available";
      swal({
        title: "Invalid QR",
        text: "This QR code is not related to any order",
        icon: "warning",
        buttons: "return",
      })
    } else {
      document.querySelector(".qr-content").hidden = true;
      document.querySelector(".qr-name").innerHTML = `${data.name}`;
      document.querySelector(".qr-quantity").innerHTML = `${data.quantity}`;
      document.querySelector(".qr-date").innerHTML = `${data.date}`;
      document.querySelector(".qr-meal").innerHTML = `${data.meal}`;
      document.querySelector(".order-picture").style.backgroundImage = `url("${data.photo}")`;
      swal({
        title: "Valid!",
        text: `${data.name} has a valid QR code!`,
        icon: "success",
        button: "Aww yiss!",
      });
    };
  });
};


document.getElementById("scan-qr").addEventListener("click", () => {
  document.querySelector(".qr-content").hidden = false;
  activeJSQR();
});

