const evettMenu = () => {
  const menuBtn = document.getElementById("menu_btn")
  const menu = document.getElementById("menu")

  menuBtn.addEventListener('mouseover', () => {
    menu.setAttribute("style", "display: block;")
  });
};

window.addEventListener('load', evettMenu);