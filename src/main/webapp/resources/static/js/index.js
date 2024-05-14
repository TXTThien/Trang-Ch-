let menuicn = document.querySelector(".menuicn");
let nav = document.querySelector(".navcontainer");

menuicn.addEventListener("click", () => {
  nav.classList.toggle("navclose");
});

// type
var dataType = [];
var isEditModeType = false;

function addType() {
  var item_typeid = document.getElementById("typeid").value;
  var item_typename = document.getElementById("typename").value;
  var item_price = document.getElementById("price").value;

  if (item_typeid === "" || item_typename === "" || item_price === "") {
    alert("Please fill in all fields");
    return;
  }

  if (isEditModeType) {
    // Thực hiện cập nhật dữ liệu thay vì thêm mới
    var index = dataType.findIndex((item) => item.TypeID === item_typeid);
    dataType[index] = {
      TypeID: item_typeid,
      TypeName: item_typename,
      Price: item_price,
    };
    isEditModeType = false; // Tắt chế độ chỉnh sửa sau khi cập nhật
  } else {
    var item = {
      TypeID: item_typeid,
      TypeName: item_typename,
      Price: item_price,
    };
    dataType.push(item);
  }

  renderType();
  clearType();
}

function renderType() {
  var table = "";
  for (let i = 0; i < dataType.length; i++) {
    table += `<tr>
          <td>${dataType[i].TypeID}</td>
          <td>${dataType[i].TypeName}</td>
          <td>${dataType[i].Price}</td>
          <td>
            <button onclick="editItemType(${i})">Edit</button>
            <button onclick="deleteItemType(${i})">Delete</button>
          </td>
        </tr>`;
  }
  document.getElementById("render-type").innerHTML = table;
}

function clearType() {
  document.getElementById("typeid").value = "";
  document.getElementById("typename").value = "";
  document.getElementById("price").value = "";
}

function deleteItemType(index) {
  var confirmBox = document.getElementById("confirmBox");
  confirmBox.style.display = "block";

  document.getElementById("confirmYes").addEventListener("click", function () {
    dataType.splice(index, 1);
    renderType();
    confirmBox.style.display = "none";
  });

  document.getElementById("confirmNo").addEventListener("click", function () {
    confirmBox.style.display = "none";
  });
}

function editItemType(index) {
  var item = dataType[index];

  document.getElementById("typeid").value = item.TypeID;
  document.getElementById("typename").value = item.TypeName;
  document.getElementById("price").value = item.Price;
  isEditMode = true; // Bật chế độ chỉnh sửa
}

//Account
var dataAccount = [];
var isEditModeAccount = false;

function addAccount() {
  var item_accountid = document.getElementById("accountid").value;
  var item_name = document.getElementById("name").value;
  var item_phonenumber = document.getElementById("phonenumber").value;
  var item_address = document.getElementById("address").value;

  if (
    item_accountid === "" ||
    item_name === "" ||
    item_phonenumber === "" ||
    item_address === ""
  ) {
    alert("Please fill in all fields");
    return;
  }

  if (isEditModeAccount) {
    // Thực hiện cập nhật dữ liệu thay vì thêm mới
    var index = dataAccount.findIndex(
      (item) => item.AccountID === item_accountid
    );
    dataAccount[index] = {
      AccountID: item_accountid,
      Name: item_name,
      PhoneNumber: item_phonenumber,
      Address: item_address,
    };
    isEditModeAccount = false; // Tắt chế độ chỉnh sửa sau khi cập nhật
  } else {
    var item = {
      AccountID: item_accountid,
      Name: item_name,
      PhoneNumber: item_phonenumber,
      Address: item_address,
    };
    dataAccount.push(item);
  }

  renderAccount();
  clearAccount();
}

function renderAccount() {
  var table = "";
  for (let i = 0; i < dataAccount.length; i++) {
    table += `<tr>
              <td>${dataAccount[i].AccountID}</td>
              <td>${dataAccount[i].Name}</td>
              <td>${dataAccount[i].PhoneNumber}</td>
              <td>${dataAccount[i].Address}</td>
              <td>
                <button onclick="editItemAccount(${i})">Edit</button>
                <button onclick="deleteItemAccount(${i})">Delete</button>
              </td>
            </tr>`;
  }
  document.getElementById("render-account").innerHTML = table;
}

function clearAccount() {
  document.getElementById("accountid").value = "";
  document.getElementById("name").value = "";
  document.getElementById("phonenumber").value = "";
  document.getElementById("address").value = "";
}

function deleteItemAccount(index) {
  var confirmBox = document.getElementById("confirmBox");
  confirmBox.style.display = "block";

  document.getElementById("confirmYes").addEventListener("click", function () {
    dataAccount.splice(index, 1);
    renderAccount();
    confirmBox.style.display = "none";
  });

  document.getElementById("confirmNo").addEventListener("click", function () {
    confirmBox.style.display = "none";
  });
}

function editItemAccount(index) {
  var item = dataAccount[index];
  document.getElementById("accountid").value = item.AccountID;
  document.getElementById("name").value = item.Name;
  document.getElementById("phonenumber").value = item.PhoneNumber;
  document.getElementById("address").value = item.Address;
  isEditModeAccount = true; // Bật chế độ chỉnh sửa
}

//Banner

var dataBanner = [];
var isEditModeBanner = false;

function addBanner() {
  var item_bannerid = document.getElementById("bannerid").value;
  var item_bannerimage = document.getElementById("bannerimage").value;
  var item_bannertype = document.getElementById("bannertype").value;
  var item_idbookorcate = document.getElementById("idbookorcate").value;

  if (item_bannerid === "" || item_bannerimage === "") {
    alert("Please fill in all fields");
    return;
  }

  if (isEditModeBanner) {
    // Thực hiện cập nhật dữ liệu thay vì thêm mới
    var index = dataBanner.findIndex((item) => item.BannerID === item_bannerid);
    dataBanner[index] = {
      BannerID: item_bannerid,
      Bannerimage: item_bannerimage,
      Bannertype: item_bannertype,
      IDbookorcate: item_idbookorcate,
    };
    isEditModeBanner = false; // Tắt chế độ chỉnh sửa sau khi cập nhật
  } else {
    var item = {
      BannerID: item_bannerid,
      Bannerimage: item_bannerimage,
      Bannertype: item_bannertype,
      IDbookorcate: item_idbookorcate,
    };
    dataBanner.push(item);
  }

  renderBanner();
  clearBanner();
}

function renderBanner() {
  var table = "";
  for (let i = 0; i < dataBanner.length; i++) {
    table += `<tr>
              <td>${dataBanner[i].BannerID}</td>
              <td>${dataBanner[i].Bannerimage}</td>
              <td>${dataBanner[i].Bannertype}</td>
              <td>${dataBanner[i].IDbookorcate}</td>
              <td>
                <button onclick="editItemBanner(${i})">Edit</button>
                <button onclick="deleteItemBanner(${i})">Delete</button>
              </td>
            </tr>`;
  }
  document.getElementById("render-Banner").innerHTML = table;
}

function clearBanner() {
  document.getElementById("bannerid").value = "";
  document.getElementById("bannerimage").value = "";
  document.getElementById("bannertype").value = "";
  document.getElementById("idbookorcate").value = "";
}

function deleteItemBanner(index) {
  var confirmBox = document.getElementById("confirmBox");
  confirmBox.style.display = "block";

  document.getElementById("confirmYes").addEventListener("click", function () {
    dataBanner.splice(index, 1);
    renderBanner();
    confirmBox.style.display = "none";
  });

  document.getElementById("confirmNo").addEventListener("click", function () {
    confirmBox.style.display = "none";
  });
}

function editItemBanner(index) {
  var item = dataBanner[index];
  document.getElementById("bannerid").value = item.BannerID;
  document.getElementById("bannerimage").value = item.Bannerimage;
  document.getElementById("bannertype").value = item.Bannertype;
  document.getElementById("idbookorcate").value = item.IDbookorcate;
  isEditModeBanner = true; // Bật chế độ chỉnh sửa
}

//Bill
var dataBill = [];
var isEditModeBill = false;

function addBill() {
  var item_billid = document.getElementById("billid").value;
  var item_accountid = document.getElementById("accountid").value;
  var item_ispaid = document.getElementById("ispaid").value;

  if (item_billid === "" || item_accountid === "") {
    alert("Please fill in all fields");
    return;
  }

  if (isEditModeBill) {
    // Thực hiện cập nhật dữ liệu thay vì thêm mới
    var index = dataBill.findIndex((item) => item.BillID === item_billid);
    dataBill[index] = {
      BillID: item_billid,
      AccountID: item_accountid,
      Ispaid: item_ispaid,
    };
    isEditModeBill = false; // Tắt chế độ chỉnh sửa sau khi cập nhật
  } else {
    var item = {
      BillID: item_billid,
      AccountID: item_accountid,
      Ispaid: item_ispaid,
    };
    dataBill.push(item);
  }

  renderBill();
  clearBill();
}

function renderBill() {
  var table = "";
  for (let i = 0; i < dataBill.length; i++) {
    table += `<tr>
              <td>${dataBill[i].BillID}</td>
              <td>${dataBill[i].AccountID}</td>
              <td>${dataBill[i].Ispaid}</td>
              <td>
                <button onclick="editItemBill(${i})">Edit</button>
                <button onclick="deleteItemBill(${i})">Delete</button>
              </td>
            </tr>`;
  }
  document.getElementById("render-Bill").innerHTML = table;
}

function clearBill() {
  document.getElementById("billid").value = "";
  document.getElementById("accountid").value = "";
  document.getElementById("ispaid").value = "";
}

function deleteItemBill(index) {
  var confirmBox = document.getElementById("confirmBox");
  confirmBox.style.display = "block";

  document.getElementById("confirmYes").addEventListener("click", function () {
    dataBill.splice(index, 1);
    renderBill();
    confirmBox.style.display = "none";
  });

  document.getElementById("confirmNo").addEventListener("click", function () {
    confirmBox.style.display = "none";
  });
}

function editItemBill(index) {
  var item = dataBill[index];
  document.getElementById("billid").value = item.BillID;
  document.getElementById("accountid").value = item.AccountID;
  document.getElementById("ispaid").value = item.Ispaid;
  isEditModeBill = true; // Bật chế độ chỉnh sửa
}

//Bill infor
var dataBillInfo = [];
var isEditModeBillInfo = false;

function addBillInfo() {
  var item_billinfoid = document.getElementById("billinfoid").value;
  var item_billid = document.getElementById("billid").value;
  var item_number = document.getElementById("number").value;
  var item_bookid = document.getElementById("bookid").value;
  var item_typebookid = document.getElementById("typebookid").value;

  if (
    item_billinfoid === "" ||
    item_billid === "" ||
    item_number === "" ||
    item_bookid === ""
  ) {
    alert("Please fill in all fields");
    return;
  }

  if (isEditModeBillInfo) {
    // Thực hiện cập nhật dữ liệu thay vì thêm mới
    var index = dataBillInfo.findIndex(
      (item) => item.BannerID === item_bannerid
    );
    dataBillInfo[index] = {
      BillinfoID: item_billinfoid,
      BillID: item_billid,
      Number: item_number,
      BookID: item_bookid,
      TypebookID: item_typebookid,
    };
    isEditModeBillInfo = false; // Tắt chế độ chỉnh sửa sau khi cập nhật
  } else {
    var item = {
      BillinfoID: item_billinfoid,
      BillID: item_billid,
      Number: item_number,
      BookID: item_bookid,
      TypebookID: item_typebookid,
    };
    dataBillInfo.push(item);
  }
  renderBillInfo();
  clearBillInfo();
}

function renderBillInfo() {
  var table = "";
  for (let i = 0; i < dataBillInfo.length; i++) {
    table += `<tr>
              <td>${dataBillInfo[i].BillinfoID}</td>
              <td>${dataBillInfo[i].BillID}</td>
              <td>${dataBillInfo[i].Number}</td>
              <td>${dataBillInfo[i].BookID}</td>
              <td>${dataBillInfo[i].TypebookID}</td>
              <td>
                <button onclick="editItemBillInfo(${i})">Edit</button>
                <button onclick="deleteItemBillInfo(${i})">Delete</button>
              </td>
            </tr>`;
  }
  document.getElementById("render-BillInfo").innerHTML = table;
}

function clearBillInfo() {
  document.getElementById("billinfoid").value = "";
  document.getElementById("billid").value = "";
  document.getElementById("number").value = "";
  document.getElementById("bookid").value = "";
  document.getElementById("typebookid").value = "";
}

function deleteItemBillInfo(index) {
  var confirmBox = document.getElementById("confirmBox");
  confirmBox.style.display = "block";

  document.getElementById("confirmYes").addEventListener("click", function () {
    dataBillInfo.splice(index, 1);
    renderBillInfo();
    confirmBox.style.display = "none";
  });

  document.getElementById("confirmNo").addEventListener("click", function () {
    confirmBox.style.display = "none";
  });
}

function editItemBillInfo(index) {
  var item = dataBillInfo[index];
  document.getElementById("billinfoid").value = item.BillinfoID;
  document.getElementById("billid").value = item.BillID;
  document.getElementById("number").value = item.Number;
  document.getElementById("bookid").value = item.BookID;
  document.getElementById("typebookid").value = item.TypebookID;
  isEditMode = true; // Bật chế độ chỉnh sửa
}

//Books
var data = [];
var isEditMode = false;

function addBooks() {
  var item_bookid = document.getElementById("bookid").value;
  var item_avatar = document.getElementById("avatar").value;
  var item_title = document.getElementById("title").value;
  var item_content = document.getElementById("content").value;
  var item_categoryid = document.getElementById("categoryid").value;
  var item_price = document.getElementById("price").value;
  var item_author = document.getElementById("author").value;
  var item_age = document.getElementById("age").value;
  var item_language = document.getElementById("language").value;
  var item_stock = document.getElementById("stock").value;
  var item_typeid = document.getElementById("typeid").value;

  if (
    item_bookid === "" ||
    item_avatar === "" ||
    item_title === "" ||
    item_content === "" ||
    item_categoryid === "" ||
    item_price === "" ||
    item_author === "" ||
    item_age === "" ||
    item_language === "" ||
    item_stock === "" ||
    item_typeid === ""
  ) {
    alert("Please fill in all fields");
    return;
  }

  if (isEditMode) {
    // Thực hiện cập nhật dữ liệu thay vì thêm mới
    var index = data.findIndex((item) => item.BookID === item_bookid);
    data[index] = {
      BookID: item_bookid,
      Avatar: item_avatar,
      Title: item_title,
      Content: item_content,
      CategoryID: item_categoryid,
      Price: item_price,
      Author: item_author,
      Age: item_age,
      Language: item_language,
      Stoke: item_stock,
      TypeID: item_typeid,
    };
    isEditMode = false; // Tắt chế độ chỉnh sửa sau khi cập nhật
  } else {
    var item = {
      BookID: item_bookid,
      Avatar: item_avatar,
      Title: item_title,
      Content: item_content,
      CategoryID: item_categoryid,
      Price: item_price,
      Author: item_author,
      Age: item_age,
      Language: item_language,
      Stoke: item_stock,
      TypeID: item_typeid,
    };
    data.push(item);
  }

  render();
  clear();
}

function render() {
  var table = "";
  for (let i = 0; i < data.length; i++) {
    table += `<tr>
              <td>${data[i].BookID}</td>
              <td>${data[i].Avatar}</td>
              <td>${data[i].Title}</td>
              <td>${data[i].Content}</td>
              <td>${data[i].CategoryID}</td>
              <td>${data[i].Price}</td>
              <td>${data[i].Author}</td>
              <td>${data[i].Age}</td>
              <td>${data[i].Language}</td>
              <td>${data[i].Stoke}</td>
              <td>${data[i].TypeID}</td>
              <td>
                <button onclick="editItem(${i})">Edit</button>
                <button onclick="deleteItem(${i})">Delete</button>
              </td>
            </tr>`;
  }
  document.getElementById("render-Books").innerHTML = table;
}

function clear() {
  document.getElementById("bookid").value = "";
  document.getElementById("avatar").value = "";
  document.getElementById("title").value = "";
  document.getElementById("content").value = "";
  document.getElementById("categoryid").value = "";
  document.getElementById("price").value = "";
  document.getElementById("author").value = "";
  document.getElementById("age").value = "";
  document.getElementById("language").value = "";
  document.getElementById("stock").value = "";
  document.getElementById("typeid").value = "";
}

function deleteItem(index) {
  var confirmBox = document.getElementById("confirmBox");
  confirmBox.style.display = "block";

  document.getElementById("confirmYes").addEventListener("click", function () {
    data.splice(index, 1);
    render();
    confirmBox.style.display = "none";
  });

  document.getElementById("confirmNo").addEventListener("click", function () {
    confirmBox.style.display = "none";
  });
}

function editItem(index) {
  var item = data[index];

  document.getElementById("bookid").value = item.BookID;
  document.getElementById("avatar").value = item.Avatar;
  document.getElementById("title").value = item.Title;
  document.getElementById("content").value = item.Content;
  document.getElementById("categoryid").value = item.CategoryID;
  document.getElementById("price").value = item.Price;
  document.getElementById("author").value = item.Author;
  document.getElementById("age").value = item.Age;
  document.getElementById("language").value = item.Language;
  document.getElementById("stock").value = item.Stoke;
  document.getElementById("typeid").value = item.TypeID;
  isEditMode = true; // Bật chế độ chỉnh sửa
}

//Cart
var dataCart = [];
var isEditModeCart = false;

function addCart() {
  var item_cartid = document.getElementById("cartid").value;
  var item_number = document.getElementById("number").value;
  var item_accountid = document.getElementById("accountid").value;
  var item_bookid = document.getElementById("bookid").value;

  if (
    item_cartid === "" ||
    item_number === "" ||
    item_accountid === "" ||
    item_bookid === ""
  ) {
    alert("Please fill in all fields");
    return;
  }

  if (isEditModeCart) {
    // Thực hiện cập nhật dữ liệu thay vì thêm mới
    var index = dataCart.findIndex((item) => item.Cartid === item_cartid);
    dataCart[index] = {
      Cartid: item_cartid,
      Number: item_number,
      AccountID: item_accountid,
      BookID: item_bookid,
    };
    isEditModeCart = false; // Tắt chế độ chỉnh sửa sau khi cập nhật
  } else {
    var item = {
      Cartid: item_cartid,
      Number: item_number,
      AccountID: item_accountid,
      BookID: item_bookid,
    };
    dataCart.push(item);
  }
  renderCart();
  clearCart();
}

function renderCart() {
  var table = "";
  for (let i = 0; i < dataCart.length; i++) {
    table += `<tr>
              <td>${dataCart[i].Cartid}</td>
              <td>${dataCart[i].Number}</td>
              <td>${dataCart[i].AccountID}</td>
              <td>${dataCart[i].BookID}</td>
              <td>
                <button onclick="editItemCart(${i})">Edit</button>
                <button onclick="deleteItemCart(${i})">Delete</button>
              </td>
            </tr>`;
  }
  document.getElementById("render-Cart").innerHTML = table;
}

function clearCart() {
  document.getElementById("cartid").value = "";
  document.getElementById("number").value = "";
  document.getElementById("accountid").value = "";
  document.getElementById("bookid").value = "";
}

function deleteItemCart(index) {
  var confirmBox = document.getElementById("confirmBox");
  confirmBox.style.display = "block";

  document.getElementById("confirmYes").addEventListener("click", function () {
    dataCart.splice(index, 1);
    renderCart();
    confirmBox.style.display = "none";
  });

  document.getElementById("confirmNo").addEventListener("click", function () {
    confirmBox.style.display = "none";
  });
}

function editItemCart(index) {
  var item = dataCart[index];
  document.getElementById("cartid").value = item.Cartid;
  document.getElementById("number").value = item.Number;
  document.getElementById("accountid").value = item.AccountID;
  document.getElementById("bookid").value = item.BookID;
  isEditModeCart = true; // Bật chế độ chỉnh sửa
}

//Category
var dataCategory = [];
var isEditModeCategory = false;

function addCategory() {
  var item_categoryid = document.getElementById("categoryid").value;
  var item_categoryname = document.getElementById("categoryname").value;
  if (item_categoryid === "" || item_categoryname === "") {
    alert("Please fill in all fields");
    return;
  }

  if (isEditModeCategory) {
    // Thực hiện cập nhật dữ liệu thay vì thêm mới
    var index = dataCategory.findIndex(
      (item) => item.CategoryID === item_categoryid
    );
    dataCategory[index] = {
      CategoryID: item_categoryid,
      CategoryName: item_categoryname,
    };
    isEditModeCategory = false; // Tắt chế độ chỉnh sửa sau khi cập nhật
  } else {
    var item = {
      CategoryID: item_categoryid,
      CategoryName: item_categoryname,
    };
    dataCategory.push(item);
  }

  renderCategory();
  clearCategory();
}

function renderCategory() {
  var table = "";
  for (let i = 0; i < dataCategory.length; i++) {
    table += `<tr>
             
              <td>${dataCategory[i].CategoryID}</td>
              <td>${dataCategory[i].CategoryName}</td>
              <td>
                <button onclick="editItemCategory(${i})">Edit</button>
                <button onclick="deleteItemCategory(${i})">Delete</button>
              </td>
            </tr>`;
  }
  document.getElementById("render-Category").innerHTML = table;
}

function clearCategory() {
  document.getElementById("categoryid").value = "";
  document.getElementById("categoryname").value = "";
}

function deleteItemCategory(index) {
  var confirmBox = document.getElementById("confirmBox");
  confirmBox.style.display = "block";

  document.getElementById("confirmYes").addEventListener("click", function () {
    dataCategory.splice(index, 1);
    renderCategory();
    confirmBox.style.display = "none";
  });

  document.getElementById("confirmNo").addEventListener("click", function () {
    confirmBox.style.display = "none";
  });
}

function editItemCategory(index) {
  var item = dataCategory[index];

  document.getElementById("categoryid").value = item.CategoryID;
  document.getElementById("categoryname").value = item.CategoryName;

  isEditModeCategory = true; // Bật chế độ chỉnh sửa
}

//News
var dataNews = [];
var isEditModeNews = false;

function addNews() {
  var item_newsid = document.getElementById("newsid").value;
  var item_newsimage = document.getElementById("newsimage").value;
  var item_newstittle = document.getElementById("newstittle").value;

  if (item_newsid === "" || item_newsimage === "" || item_newstittle === "") {
    alert("Please fill in all fields");
    return;
  }

  if (isEditModeNews) {
    // Thực hiện cập nhật dữ liệu thay vì thêm mới
    var index = dataNews.findIndex((item) => item.NewsID === item_newsid);
    dataNews[index] = {
      NewsID: item_newsid,
      Newsimage: item_newsimage,
      Newstittle: item_newstittle,
    };
    isEditModeNews = false; // Tắt chế độ chỉnh sửa sau khi cập nhật
  } else {
    var item = {
      NewsID: item_newsid,
      Newsimage: item_newsimage,
      Newstittle: item_newstittle,
    };
    dataNews.push(item);
  }

  renderNews();
  clearNews();
}

function renderNews() {
  var table = "";
  for (let i = 0; i < dataNews.length; i++) {
    table += `<tr>
              <td>${dataNews[i].NewsID}</td>
              <td>${dataNews[i].Newsimage}</td>
              <td>${dataNews[i].Newstittle}</td>
              <td>
                <button onclick="editItemNews(${i})">Edit</button>
                <button onclick="deleteItemNews(${i})">Delete</button>
              </td>
            </tr>`;
  }
  document.getElementById("render-News").innerHTML = table;
}

function clearNews() {
  document.getElementById("newsid").value = "";
  document.getElementById("newsimage").value = "";
  document.getElementById("newstittle").value = "";
}

function deleteItemNews(index) {
  var confirmBox = document.getElementById("confirmBox");
  confirmBox.style.display = "block";

  document.getElementById("confirmYes").addEventListener("click", function () {
    dataNews.splice(index, 1);
    renderNews();
    confirmBox.style.display = "none";
  });

  document.getElementById("confirmNo").addEventListener("click", function () {
    confirmBox.style.display = "none";
  });
}

function editItemNews(index) {
  var item = dataNews[index];

  document.getElementById("newsid").value = item.NewsID;
  document.getElementById("newsimage").value = item.Newsimage;
  document.getElementById("newstittle").value = item.Newstittle;
  isEditMode = true; // Bật chế độ chỉnh sửa
}

//ReadBefore
var dataRead = [];
var isEditModeRead = false;

function addReadBefore() {
  var item_readid = document.getElementById("readid").value;
  var item_bookid = document.getElementById("bookid").value;
  var item_imagelink = document.getElementById("imagelink").value;

  if (item_readid === "" || item_bookid === "" || item_imagelink === "") {
    alert("Please fill in all fields");
    return;
  }

  if (isEditModeRead) {
    // Thực hiện cập nhật dữ liệu thay vì thêm mới
    var index = dataRead.findIndex((item) => item.ReadID === item_readid);
    dataRead[index] = {
      ReadID: item_readid,
      BookID: item_bookid,
      ImageLink: item_imagelink,
    };
    isEditModeRead = false; // Tắt chế độ chỉnh sửa sau khi cập nhật
  } else {
    var item = {
      ReadID: item_readid,
      BookID: item_bookid,
      ImageLink: item_imagelink,
    };
    dataRead.push(item);
  }

  renderRead();
  clearRead();
}

function renderRead() {
  var table = "";
  for (let i = 0; i < dataRead.length; i++) {
    table += `<tr>
              <td>${dataRead[i].ReadID}</td>
              <td>${dataRead[i].BookID}</td>
              <td>${dataRead[i].ImageLink}</td>
              <td>
                <button onclick="editItemRead(${i})">Edit</button>
                <button onclick="deleteItemRead(${i})">Delete</button>
              </td>
            </tr>`;
  }
  document.getElementById("render-Read").innerHTML = table;
}

function clearRead() {
  document.getElementById("readid").value = "";
  document.getElementById("bookid").value = "";
  document.getElementById("imagelink").value = "";
}

function deleteItemRead(index) {
  var confirmBox = document.getElementById("confirmBox");
  confirmBox.style.display = "block";

  document.getElementById("confirmYes").addEventListener("click", function () {
    dataRead.splice(index, 1);
    renderRead();
    confirmBox.style.display = "none";
  });

  document.getElementById("confirmNo").addEventListener("click", function () {
    confirmBox.style.display = "none";
  });
}

function editItemRead(index) {
  var item = dataRead[index];

  document.getElementById("readid").value = item.ReadID;
  document.getElementById("bookid").value = item.BookID;
  document.getElementById("imagelink").value = item.ImageLink;
  isEditModeRead = true; // Bật chế độ chỉnh sửa
}

//Reviews
var dataReviews = [];
var isEditModeReviews = false;

function addReviews() {
  var item_reviewid = document.getElementById("reviewid").value;
  var item_bookid = document.getElementById("bookid").value;
  var item_point = document.getElementById("point").value;
  var item_accountid = document.getElementById("accountid").value;
  var item_comment = document.getElementById("comment").value;

  if (
    item_reviewid === "" ||
    item_bookid === "" ||
    item_point === "" ||
    item_accountid === "" ||
    item_comment === ""
  ) {
    alert("Please fill in all fields");
    return;
  }

  if (isEditModeReviews) {
    // Thực hiện cập nhật dữ liệu thay vì thêm mới
    var index = dataReviews.findIndex(
      (item) => item.ReviewID === item_reviewid
    );
    dataReviews[index] = {
      ReviewID: item_reviewid,
      BookID: item_bookid,
      Point: item_point,
      AccountID: item_accountid,
      Comment: item_comment,
    };
    isEditModeReviews = false; // Tắt chế độ chỉnh sửa sau khi cập nhật
  } else {
    var item = {
      ReviewID: item_reviewid,
      BookID: item_bookid,
      Point: item_point,
      AccountID: item_accountid,
      Comment: item_comment,
    };
    dataReviews.push(item);
  }

  renderReviews();
  clearReviews();
}

function renderReviews() {
  var table = "";
  for (let i = 0; i < dataReviews.length; i++) {
    table += `<tr>
              <td>${dataReviews[i].ReviewID}</td>
              <td>${dataReviews[i].BookID}</td>
              <td>${dataReviews[i].Point}</td>
              <td>${dataReviews[i].AccountID}</td>
              <td>${dataReviews[i].Comment}</td>
              <td>
                <button onclick="editItemReviews(${i})">Edit</button>
                <button onclick="deleteItemReviews(${i})">Delete</button>
              </td>
            </tr>`;
  }
  document.getElementById("render-Reviews").innerHTML = table;
}

function clearReviews() {
  document.getElementById("reviewid").value = "";
  document.getElementById("bookid").value = "";
  document.getElementById("point").value = "";
  document.getElementById("accountid").value = "";
  document.getElementById("comment").value = "";
}

function deleteItemReviews(index) {
  var confirmBox = document.getElementById("confirmBox");
  confirmBox.style.display = "block";

  document.getElementById("confirmYes").addEventListener("click", function () {
    dataReviews.splice(index, 1);
    renderReviews();
    confirmBox.style.display = "none";
  });

  document.getElementById("confirmNo").addEventListener("click", function () {
    confirmBox.style.display = "none";
  });
}

function editItemReviews(index) {
  var item = dataReviews[index];

  document.getElementById("reviewid").value = item.ReviewID;
  document.getElementById("bookid").value = item.BookID;
  document.getElementById("point").value = item.Point;
  document.getElementById("accountid").value = item.AccountID;
  document.getElementById("comment").value = item.Comment;
  isEditModeReviews = true; // Bật chế độ chỉnh sửa
}

//Type
