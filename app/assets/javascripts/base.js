function optionize(data) {
  var opt = document.createElement('option');
  opt.value = data[1];
  var d = document.createTextNode(data[0]);
  opt.appendChild(d);

  return opt;
}

function renderTo(container, data) {
  var cont = document.getElementById(container);
  cont.innerHTML = "";
  data.forEach(function(e) {
    cont.appendChild(optionize(e));
  });
}

function focusTo(selector) {
  document.querySelector(selector).focus();
}

function materialFinalPrice(tr) {
  var price = parseFloat(tr.dataset.price);
  var vol   = parseFloat(tr.innerText);
  return (price*vol);
}

function priceExplained(tr) {
  var priceLiteral  = tr.dataset.price;
  var volumeLiteral = tr.innerText;
  return priceLiteral+" x "+volumeLiteral + " = " + materialFinalPrice(tr).toFixed(2);
}

function printPage() {
   window.print();
}

window.onload = function() {
 var cont = document.getElementById('region');
 if (cont !== null){
    cont.addEventListener('change', function(e){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        renderTo('forestry', JSON.parse(xhttp.response));
        focusTo('#forestry');
      }
    };
    xhttp.open('GET', '/load_forestries?region_id='+e.target.value, true);
    xhttp.send();

   });  
  }

  if (window.location.pathname == '/search') {
    var data = document.querySelectorAll('[data-price]');

    document.getElementById('total-sum').innerHTML = 
      [].slice.call(data)
      .map(tr => materialFinalPrice(tr))
      .reduce((e, f) => e + f ).toFixed(2);
 
  }
}
