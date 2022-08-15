const elem = document.getElementById('user_user_type');
changeHidden(elem);
elem.addEventListener('change', () => changeHidden(elem));

function changeHidden(elem) {
  if (elem.value === "2") {
    document.getElementById("hidden_store").style.display = "initial";
  } else {
    document.getElementById("hidden_store").style.display = "none";
    document.getElementById("user_store_id").value = "";
  }
}
