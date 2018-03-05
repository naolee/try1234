
if (window.performance) {
  console.info("window.performance work's fine on this browser");
}
if (performance.navigation.type === 1) {
  alert( "This page is reloaded" );
} else {
  console.info( "This page is not reloaded");
}