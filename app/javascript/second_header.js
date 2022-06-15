const secondHeader = () => {
  const activeList = document.getElementById("active-list");
  const listName = document.querySelectorAll(".list-name");  
  const userEvettList = document.getElementById("user-evett-list");
  const userInfoArea = document.getElementById("user-info-area");

  listName.forEach(function(list, index){
    list.addEventListener("click", function (){
      activeList.removeAttribute("id");
      list.setAttribute("id", "active-list");
      if(index == 0){
        userEvettList.removeAttribute("style", "display:none;");
        userEvettList.setAttribute("style", "display:block;");
        userInfoArea.removeAttribute("style", "display:flex;");
        userInfoArea.setAttribute("style", "display:none;");
      }else{
        userEvettList.removeAttribute("style", "display:block;");
        userEvettList.setAttribute("style", "display:none;");
        userInfoArea.removeAttribute("style", "display:none;");
        userInfoArea.setAttribute("style", "display:flex;");
      };
    });
  });
};

window.addEventListener('load', secondHeader);