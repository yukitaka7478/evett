const followList = () => {
  const following = document.getElementById("following");
  const followed = document.getElementById("followed");
  const followedArea = document.getElementById("followed-area");
  const followingArea = document.getElementById("following-area");

    following.addEventListener('click', () => {
      followedArea.setAttribute("style", "display:none;");
      followingArea.setAttribute("style", "display:block;");
    });
    followed.addEventListener('click', () => {
      followingArea.setAttribute("style", "display:none;");
      followedArea.setAttribute("style", "display:block;");
    });
};

window.addEventListener('load', followList);