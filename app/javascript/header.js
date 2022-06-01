const header = () => {
  const allUser = document.getElementById('all_user_tag')
  const friend = document.getElementById('friend_tag')
  const onlyUser = document.getElementById('only_user_tag')
  allUser.addEventListener('mouseover', () => {
    allUser.setAttribute("style", "background-color: lightblue;")
  });
  allUser.addEventListener('click', (e) => {
    e.preventDefault();
    const XHR = new XMLHttpRequest();
    XHR.open("GET", "/evetts", true);
    XHR.responseType = "json";
    XHR.send();
  });
};

window.addEventListener('load', header);