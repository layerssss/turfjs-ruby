const turf = require("@turf/turf");
global.turf = turf;
global.turfAPIs = () =>
  Object.keys(turf).filter(key => turf[key].constructor === Function);
