import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)
export default new Router({
mode: 'history',
base: process.env.BASE_URL,
routes:[
{
    path: '*',
    name:'404',
    meta:{layout: 'GeneralHeader', title:'404-page...',},
    component: ()=> import('./views/PageNotFound.vue'),
},
{
    path: '/',
    name:'Home',
    meta:{layout:'GeneralHeader', title:'Home'},
    component: ()=> import('./views/Home.vue'),
},
{
    path: '/site/signin',
    name:'Signin',
    meta:{layout:'GeneralHeader', title: 'Sign In'},
    component: ()=> import('./secure/Signin.vue')
},
{
    path: '/site/logout',
    name: 'logout',
    meta: {layout:'GeneralHeader', title: 'logout'},
    component: ()=> import('./secure/Logout.vue')
},
{
    path: '/site/about',
    name:'About',
    meta:{layout:'GeneralHeader', title:'About us',},
    component: ()=> import('./views/About.vue')
},
{
    path: '/site/contact',
    name:'Contact',
    meta:{layout:'GeneralHeader', title:'Contact us'},
    component: ()=> import('./views/Contactus.vue')
},
{
    path: '/oath/statement',
    name:'Statement',
    meta:{layout:'SidebarNoOath', title:'statement'},
    component: ()=> import('./views/About.vue')
},

{
    path: '/oath/dashboard',
    name: 'dashboard',
    meta: {layout:'BackendHeader', title: 'Dashboard'},
    component: ()=> import('./secure/Dashboard.vue')
},
{
    path: '/oath/panel',
    name: 'panel',
    meta: {layout:'SidebarNoOath', title: 'Base'},
    component: ()=> import('./secure/Dashboard.vue')
},

{
    path: '/oath/report',
    name: 'report',
    meta: {layout:'BackendHeader', title: 'Report'},
    component: ()=> import('./secure/Report.vue')
},


{
    path: '/oath/template',
    name: 'template',
    meta: {layout:'SidebarNoOath', title: 'Template'},
    component: ()=> import('./views/template.vue')
},

{
    path: '/oath/uploadpayment',
    name: 'uploadpayment',
    meta: {layout:'BackendHeader', title: 'Upload payment'},
    component: ()=> import('./secure/Uploadpayment.vue')
},
{
    path: '/oath/searchaccount',
    name: 'searchaccount',
    meta: {layout:'BackendHeader', title: 'Search account'},
    component: ()=> import('./secure/Searchaccount.vue')
},
{
    path: '/oath/adminaccount',
    name: 'Adminaccount',
    meta: {layout:'BackendHeader', title: 'Admin account'},
    component: ()=> import('./secure/Adminaccount.vue')
},
{
    path: '/oath/adminrecord',
    name: 'AdminRecord',
    meta: {layout:'BackendHeader', title: 'Admin account'},
    component: ()=> import('./secure/AdminRecord.vue')
},

{
    path: '/oath/useraccount',
    name: 'useraccount',
    meta: {layout:'BackendHeader', title: 'Users account'},
    component: ()=> import('./secure/Useraccount.vue')
},
{
    path: '/oath/userrecord',
    name: 'userrecord',
    meta: {layout:'BackendHeader', title: 'Users account'},
    component: ()=> import('./secure/UserRecord.vue')
},

{
    path: '/oath/services',
    name: 'services',
    meta: {layout:'BackendHeader', title: 'Service'},
    component: ()=> import('./secure/Services.vue')
},
{
    path: '/oath/invoice/:invoice',
    name: 'invoice',
    meta: {layout:'BackendHeader', title: 'Invoice'},
    component: ()=> import('./secure/NewInvoice.vue')
},
{
    path: '/oath/flagged',
    name: 'flagged',
    meta: {layout:'BackendHeader', title: 'Flagged List'},
    component: ()=> import('./secure/Flaggedlist.vue')
},
{
    path: '/oath/invoices',
    name: 'Invoices',
    meta: {layout:'BackendHeader', title: 'Invoice List'},
    component: ()=> import('./secure/Invoices.vue')
},
]


})