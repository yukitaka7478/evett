const header = () => {
  const activeTag = document.getElementById("active-tag");
  const listName = document.querySelectorAll(".list-name");  
  const allTab = document.getElementById("all");
  const friendTab = document.getElementById("friend");
  const userTab = document.getElementById("user");

  listName.forEach(function(list, index){
    list.addEventListener("click", function (e){
      e.preventDefault();
      activeTag.removeAttribute("id");
      list.setAttribute("id", "active-tag");
      if(index == 0){
        userTab.removeAttribute("style", "display:flex;");
        userTab.setAttribute("style", "display:none;");
        friendTab.removeAttribute("style", "display:flex;");
        friendTab.setAttribute("style", "display:none;");
        allTab.removeAttribute("style", "display:none;");
        allTab.setAttribute("style", "display:flex;");
      }else if(index == 1){
        userTab.removeAttribute("style", "display:flex;");
        userTab.setAttribute("style", "display:none;");
        allTab.removeAttribute("style", "display:flex;");
        allTab.setAttribute("style", "display:none;");
        friendTab.removeAttribute("style", "display:none;");
        friendTab.setAttribute("style", "display:flex;");
      }else{
        allTab.removeAttribute("style", "display:flex;");
        allTab.setAttribute("style", "display:none;");
        friendTab.removeAttribute("style", "display:flex;");
        friendTab.setAttribute("style", "display:none;");
        userTab.removeAttribute("style", "display:none;");
        userTab.setAttribute("style", "display:flex;");
      };      
    });
  });
};

window.addEventListener('load', header);