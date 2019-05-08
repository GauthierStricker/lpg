
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
  document.body.style.width = '100%';
  document.body.style.position = 'fixed';
  console.log("tada")
  console.log(document.body.style.width)
  console.log(document.body.style.position)

}

function allowScrolling() {
  document.body.style.removeProperty("width");
  document.body.style.removeProperty("position");
  console.log("tidi")
  console.log(document.body.style.width)
  console.log(document.body.style.position)


}
export { sideNavMobile };
