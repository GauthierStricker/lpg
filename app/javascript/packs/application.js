import "bootstrap";
import 'materialize-css/dist/js/materialize';
import { pickDate } from 'packs/datepicker.js.erb';
import { test } from 'packs/datepicker.js.erb';
import { sideNavMobile } from 'packs/side_nav_mobile.js'

pickDate();
sideNavMobile();
