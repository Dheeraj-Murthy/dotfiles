"use strict";var d=Object.defineProperty;var l=Object.getOwnPropertyDescriptor;var m=Object.getOwnPropertyNames;var r=Object.prototype.hasOwnProperty;var p=(n,t)=>{for(var o in t)d(n,o,{get:t[o],enumerable:!0})},u=(n,t,o,c)=>{if(t&&typeof t=="object"||typeof t=="function")for(let a of m(t))!r.call(n,a)&&a!==o&&d(n,a,{get:()=>t[a],enumerable:!(c=l(t,a))||c.enumerable});return n};var h=n=>u(d({},"__esModule",{value:!0}),n);var y={};p(y,{default:()=>s});module.exports=h(y);var e=require("@raycast/api"),i=require("react/jsx-runtime"),v=`# Command Replaced

The **Customize Order** command has been removed.

The old priority-ordering system (where you ranked multiple devices as fallbacks) has been replaced by a simpler single-default model.

## What to do instead

1. Open **Set Output Device** or **Set Input Device**
2. Press **Cmd+Shift+D** on the device you want to select as default
3. That device will be automatically restored within 10 seconds if macOS switches away
`;function s(){return(0,i.jsx)(e.Detail,{markdown:v,actions:(0,i.jsxs)(e.ActionPanel,{children:[(0,i.jsx)(e.Action,{title:"Open Set Output Device",onAction:()=>(0,e.launchCommand)({name:"set-output-device",type:e.LaunchType.UserInitiated})}),(0,i.jsx)(e.Action,{title:"Open Set Input Device",onAction:()=>(0,e.launchCommand)({name:"set-input-device",type:e.LaunchType.UserInitiated})}),(0,i.jsx)(e.Action,{title:"Disable This Command",onAction:e.openCommandPreferences})]})})}
