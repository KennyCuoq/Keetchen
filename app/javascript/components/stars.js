function starToggle() {
  const stars = document.getElementById("star");
  stars.addEventListener("click", (event) => {
    element.classList.remove("far");
    element.classList.add("fas");

    // event.currentTarget.classList.toggle("fas fa-star");
  });
}

export { starToggle };
