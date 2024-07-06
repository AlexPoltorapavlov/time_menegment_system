//= require @hotwired/turbo-rails

isTurbolinksEnabled = () => {
  try {
    return Turbolinks.supported;
  } catch(_) {
    return false;
  }
}

console.log(isTurbolinksEnabled());