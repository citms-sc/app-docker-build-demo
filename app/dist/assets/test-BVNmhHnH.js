import{r as s,e as w,x as i,o as C,c as S,a as d,u as r,k as m,w as q,b as p,G as x}from"./index-Db60hw1j.js";const U={__name:"test",props:{modelValue:{type:String},rules:{type:Object},label:String,name:String,placeholder:String,required:{type:Boolean,default:!1},columns:{type:Array,default:[]}},emits:["update:modelValue"],setup(c,{emit:f}){const l=c,v=f;let V=s("");console.log(l.modelValue);let g=w(()=>l.columns),t=s("");i(()=>l.modelValue,(n,e)=>{t.value=n});let u=s(["女"]);i(()=>u.value,(n,e)=>{console.log(n,e)});let o=s(!1);const k=({selectedOptions:n})=>{var e;v("update:modelValue",(e=n[0])==null?void 0:e.value),o.value=!1},y=()=>{console.log(l.modelValue),o.value=!0,l.modelValue!==""&&(V.value=l.modelValue)};return(n,e)=>{const _=p("van-field"),b=p("van-picker"),h=p("van-popup");return C(),S("div",null,[d(_,{modelValue:r(t),"onUpdate:modelValue":e[0]||(e[0]=a=>m(t)?t.value=a:t=a),label:l.label,name:l.name,placeholder:l.placeholder,required:l.required,"is-link":"",readonly:"",onClick:y},null,8,["modelValue","label","name","placeholder","required"]),d(h,{show:r(o),"onUpdate:show":e[3]||(e[3]=a=>m(o)?o.value=a:o=a),position:"bottom",round:""},{default:q(()=>[d(b,{modelValue:r(u),"onUpdate:modelValue":e[1]||(e[1]=a=>m(u)?u.value=a:u=a),columns:r(g),style:x({height:l.height}),onCancel:e[2]||(e[2]=a=>m(o)?o.value=!1:o=!1),onConfirm:k},null,8,["modelValue","columns","style"])]),_:1},8,["show"])])}}};export{U as default};
