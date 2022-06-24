const followList = () => {
  const following = document.getElementById("following");
  const followed = document.getElementById("followed");
  const followedArea = document.getElementById("followed-area");
  const followingArea = document.getElementById("following-area");

    followed.addEventListener('click', () => {
      followedArea.setAttribute("style", "display:none;");
      followingArea.setAttribute("style", "display:block;");
    });
    following.addEventListener('click', () => {
      followingArea.setAttribute("style", "display:none;");
      followedArea.setAttribute("style", "display:block;");
    });
};

window.addEventListener('load', followList);