"use strict";var m=Object.create;var s=Object.defineProperty;var y=Object.getOwnPropertyDescriptor;var v=Object.getOwnPropertyNames;var w=Object.getPrototypeOf,S=Object.prototype.hasOwnProperty;var g=(e,t)=>{for(var r in t)s(e,r,{get:t[r],enumerable:!0})},c=(e,t,r,i)=>{if(t&&typeof t=="object"||typeof t=="function")for(let n of v(t))!S.call(e,n)&&n!==r&&s(e,n,{get:()=>t[n],enumerable:!(i=y(t,n))||i.enumerable});return e};var x=(e,t,r)=>(r=e!=null?m(w(e)):{},c(t||!e||!e.__esModule?s(r,"default",{value:e,enumerable:!0}):r,e)),O=e=>c(s({},"__esModule",{value:!0}),e);var P={};g(P,{default:()=>A});module.exports=O(P);var o=require("@raycast/api");var b=require("@raycast/api");var a=x(require("node:process"),1),u=require("node:util"),l=require("node:child_process"),h=(0,u.promisify)(l.execFile);async function p(e,{humanReadableOutput:t=!0,signal:r}={}){if(a.default.platform!=="darwin")throw new Error("macOS only");let i=t?[]:["-ss"],n={};r&&(n.signal=r);let{stdout:f}=await h("osascript",["-e",e,i],n);return f.trim()}async function d(e){await p(`
    tell application "System Preferences"
      reveal pane id "com.apple.preference.sound"
    end tell
    tell application "System Events"
      tell application process "System Preferences"
        repeat until exists tab group 1 of window "Sound"
        end repeat
        tell tab group 1 of window "Sound"
          click radio button "Output"
          tell table 1 of scroll area 1
            select (row 1 where value of text field 1 is "${e}")
          end tell
        end tell
      end tell
    end tell

    if application "System Preferences" is running then
      tell application "System Preferences" to quit
    end if
  `)}var A=async()=>{let e=(0,o.getPreferenceValues)();if(e.favourite!=null&&e.favourite!=="")try{await d(e.favourite),await(0,o.showHUD)(`Active output audio device set to ${e.favourite}`)}catch(t){console.error(t),await(0,o.showToast)({style:o.Toast.Style.Failure,title:"Favourite output audio device could not be set"})}else await(0,o.showToast)({style:o.Toast.Style.Failure,title:"No favourite output audio device specified"})};
