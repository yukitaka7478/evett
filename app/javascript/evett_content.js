const shadow = () => {
  const evettAreas = document.querySelectorAll(".evett_area");

  evettAreas.forEach( function(evett) {
    evett.addEventListener('mouseover', function() {
      this.setAttribute("style", "box-shadow: 0 10px 25px 0 rgba(5, 5, 5, 0.4);");
    });
    evett.addEventListener('mouseout', function() {
      this.removeAttribute("style", "box-shadow: ;");
    });
  });
};

window.addEventListener('load', shadow);
