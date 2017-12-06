function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function serialize(obj) {
  var str = [];
  for(var p in obj)
    if (obj.hasOwnProperty(p)) {
      str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
    }
  return str.join("&");
}



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

function calculateSums() {
  var data = document.querySelectorAll('[data-price]');

  document.getElementById('total-sum').innerHTML = 
    [].slice.call(data)
    .map(tr => materialFinalPrice(tr))
    .reduce((e, f) => e + f ).toFixed(2);

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
    calculateSums();
  }

  document.getElementById('inline-form-submit').addEventListener('click', function(e){
    e.preventDefault();

    qs = {
      classification_id: getParameterByName('classification_id'),
      tariff_id: getParameterByName('tariff_id'),
      tree_id: document.getElementById('inline-remote-form-tree-id').value,
      diameter: document.getElementById('inline-remote-form-tree-diameter').value,
      material: document.getElementById('inline-remote-form-tree-material').value,
      semi_material: document.getElementById('inline-remote-form-tree-semi-material').value,
      combustible: document.getElementById('inline-remote-form-tree-combustible').value
    }

    var url = '/search?' + serialize(qs);

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function(){
      if (this.readyState == 4 && this.status == 200) {
        var tbl_body =  document.querySelector('tbody');
        tbl_body.innerHTML += xhr.response;
        calculateSums();
      }
    }
    xhr.open('GET', url, true);
    xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
    xhr.send();
  });

}

function printPage() {
    window.print();
}

function makeJSONFromRowData(row){
  return {
    classification_id: getParameterByName('classification_id'),
    region_id: getParameterByName('region'),
    forestry_id: getParameterByName('forestry'),
    detour_id: getParameterByName('detour'),
    quarter_id: getParameterByName('quarter'),
    tree_id: row.cells[0].dataset.treePk,

    diameter: row.cells[1].innerText,

    material_count: row.cells[2].innerText,
    semi_material_count: row.cells[3].innerText,
    combustible_count: row.cells[4].innerText,

    material_large_volume: row.cells[6].innerText,
    material_large_price: row.cells[6].dataset.price,

    material_mid_volume: row.cells[7].innerText,
    material_mid_price: row.cells[7].dataset.price,

    material_small_volume: row.cells[8].innerText,
    material_small_price: row.cells[8].dataset.price,

    material_combustible_volume: row.cells[10].innerText,
    material_combustible_price: row.cells[10].dataset.price,

    material_garbage_volume: row.cells[11].innerText,
    material_garbage_price: row.cells[11].dataset.price,

    material_umbrella_volume: row.cells[12].innerText,
    material_umbrella_price: row.cells[12].dataset.price,
  }
}

function getDataFromSearchTable() {
  var rows = Array.from(document.querySelector('tbody').rows);

  rows.forEach(function(row) {
      var rowObj = makeJSONFromRowData(row);




  });
}
