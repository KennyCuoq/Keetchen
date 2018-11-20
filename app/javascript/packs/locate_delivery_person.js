function geoFindMe(employeeID) {
  const output = document.getElementById("coordinates");

  if (!navigator.geolocation){
    output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
    return;
  }

  function success(position) {
    const latitude  = position.coords.latitude;
    const longitude = position.coords.longitude;

    // output.innerHTML = '<p>Latitude is ' + latitude + '° <br>Longitude is ' + longitude + '°</p>';


    const GPSCoordinates = {
      lat: latitude,
      lng: longitude,
    }



    fetch(`/employees/${employeeID}/update_position`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        'X-CSRF-Token': Rails.csrfToken(),
        "Content-Type": 'application/json',
        "Accept": 'application/json'

      },
      body: JSON.stringify(GPSCoordinates)
    })
    .then(response => response.json())
    .then(data => output.innerHTML = "<p>" + 'Location last updated: ' + data.last_updated + "</p>");

    // const img = new Image();
    // img.src = "https://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

    // output.appendChild(img);
  }

  function error() {
    output.innerHTML = "Unable to retrieve your location";
  }

  output.innerHTML = "<p>Locating…</p>";

  navigator.geolocation.watchPosition(success, error);
  // navigator.geolocation.getCurrentPosition(success, error);
}

global.geoFindMe = geoFindMe;
