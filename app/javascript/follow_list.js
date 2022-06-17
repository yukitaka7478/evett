const followList = () => {
  const following = document.getElementById("following");
  const followed = document.getElementById("followed");
  const active = document.getElementById("follow_active");
  const hidden = document.getElementById("follow_hidden");
  following.addEventListener('click', () => {
    active.removeAttribute("style", "display:none;");
    active.setAttribute("style", "display:flex;");
    hidden.removeAttribute("style", "display:flex;");
    hidden.setAttribute("style", "display:none;");
  });
  followed.addEventListener('click', () => {
    hidden.removeAttribute("style", "display:none;");
    hidden.setAttribute("style", "display:flex;");
    active.removeAttribute("style", "display:flex;");
    active.setAttribute("style", "display:none;");
  });
};

window.addEventListener('load', followList);