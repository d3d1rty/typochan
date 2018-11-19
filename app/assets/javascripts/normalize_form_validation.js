// Adjusts nodes inserted by Rails form validation (.fields-with-errors)
// to work with Bootstrap 4 styling.
function normalizeFormValidation() {
  let fields_with_errors = document.querySelectorAll('.field_with_errors');
  fields_with_errors.forEach(function(field){
    if (field.lastChild.localName == 'input' || field.lastChild.localName == 'textarea'){
      field.lastChild.classList.add('is-invalid');
    } else {
      field.lastChild.classList.add('text-danger');
    }
    field.parentElement.insertBefore(field.lastChild, field);
    field.parentElement.removeChild(field);
  });
}
