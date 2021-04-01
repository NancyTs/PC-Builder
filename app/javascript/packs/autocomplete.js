import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

document.addEventListener('focusin', function() {
  console.log("here")
  const active = document.activeElement;
  if(active.classList.contains("autocompleted")){

    if(active){
      var xhr;
      new autocomplete({
        selector: active,
        minChars: 3,
        source: function(term, suggest){
          try { xhr.abort(); } catch(e){}
          xhr = $.getJSON('/autocomplete',
            { input: term, type: active.id },
            function(data) {
              return data;
          }).then((data) => {
            suggest(data);
        })
      },
      onSelect: function(e, term, item){
      console.log("before" + active.value);
        active.value = item.getAttribute('data-val');
        console.log("after" + active.value);
        }
    })
  }
  }
}, true);
