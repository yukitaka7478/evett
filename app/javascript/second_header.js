const secondHeader = () => {
  const activeList = document.getElementById("active-list");
  const listName = document.querySelectorAll(".list-name");  
  const userEvettList = document.getElementById("user-evett-list");
  const userInfoArea = document.getElementById("user-info-area");
  const userRankArea = document.getElementById("user-rank-area");

  listName.forEach(function(list, index){
    list.addEventListener("click", function (){
      activeList.removeAttribute("id");
      list.setAttribute("id", "active-list");
      if(index == 0){
        userEvettList.setAttribute("style", "display:block;");
        userInfoArea.setAttribute("style", "display:none;");
        userRankArea.setAttribute("style", "display:none;");
      }else if(index == 1){
        userEvettList.setAttribute("style", "display:none;");
        userInfoArea.setAttribute("style", "display:flex;");
        userRankArea.setAttribute("style", "display:none;");
      }else{
        userEvettList.setAttribute("style", "display:none;");
        userInfoArea.setAttribute("style", "display:none;");
        userRankArea.setAttribute("style", "display:flex;");
      };
    });
  });
};

window.addEventListener('load', secondHeader);