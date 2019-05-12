
function sideNavMobile() {
document.addEventListener('DOMContentLoaded', function() {
  console.log(document.body.style.width)
  console.log(document.body.style.position)
    var elems = document.querySelectorAll('.sidenav');
    var instances = M.Sidenav.init(elems, {
      onOpenStart: preventScrolling,
      onCloseEnd: allowScrolling
    });
  });
};


function preventScrolling() {
  if (document.width < 992) {
  document.body.style.width = '100%';
  document.body.style.position = 'fixed';
  };
}

function allowScrolling() {
   if (document.width < 992) {
  document.body.style.removeProperty("width");
  document.body.style.removeProperty("position");
  };
}
export { sideNavMobile };
