var tabs = document.querySelectorAll(".tabs_wrap ul li");
var clients = document.querySelectorAll(".client");
var employees = document.querySelectorAll(".employee");
var products = document.querySelectorAll(".product"); 
var suppliers = document.querySelectorAll(".supplier");  
var all = document.querySelectorAll(".item_wrap");

tabs.forEach((tab)=>{
    
  tab.addEventListener("click", ()=>{
    tabs.forEach((tab)=>{
      tab.classList.remove("active");
    })
    tab.classList.add("active");
    var tabval = tab.getAttribute("data-tabs");

    all.forEach((item)=>{
      item.style.display = "none";
    })

    if(tabval == "client"){
      clients.forEach((client)=>{
        client.style.display = "block";
      })
    }
    else if(tabval == "employee"){
      employees.forEach((employee)=>{
        employee.style.display = "block";
      })
    } 
    else if(tabval == "product"){
        products.forEach((product)=>{
            product.style.display = "block";
            })
    }
    else if(tabval == "supplier"){
        suppliers.forEach((supplier)=>{
            supplier.style.display = "block";
            })
    }
  })
})