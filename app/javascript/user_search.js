const search = () => {
  const searchForm = document.querySelector("#search-input");
  if (searchForm){
    const result = document.getElementById("search-input");
    result.addEventListener('input', () => {
      const keyword = document.getElementById("search-input").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/users/search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const resultElement = document.getElementById("result");
        resultElement.innerHTML = "";
        if (XHR.response) {
          const userName = XHR.response.keyword;
          userName.forEach((user) => {
            const childResult = document.createElement("a");
            childResult.setAttribute("id", user.id);
            childResult.setAttribute("class", "child");
            childResult.href = `/users/${user.id}`;
            childResult.textContent = `${user.nickname}`;
            resultElement.appendChild(childResult);
          });
        };
      };
    }); 
  };
};

window.addEventListener('DOMContentLoaded', search);