<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.breadcrumb, .button, .delete, .file, .is-unselectable, .modal-close,
	.pagination-ellipsis, .pagination-link, .pagination-next,
	.pagination-previous, .tabs {
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none
}

.navbar-link:not (.is-arrowless ):after, .select:not (.is-multiple ):not
	(.is-loading ):after {
	border: 3px solid transparent;
	border-radius: 2px;
	border-right: 0;
	border-top: 0;
	content: " ";
	display: block;
	height: .625em;
	margin-top: -.4375em;
	pointer-events: none;
	position: absolute;
	top: 50%;
	transform: rotate(-45deg);
	transform-origin: center;
	width: .625em
}

.block:not (:last-child ), .box:not (:last-child ), .breadcrumb:not (:last-child
	), .content:not (:last-child ), .highlight:not (:last-child ), .level:not
	(:last-child ), .list:not (:last-child ), .message:not (:last-child ),
	.notification:not (:last-child ), .progress:not (:last-child ),
	.subtitle:not (:last-child ), .table-container:not (:last-child ),
	.table:not (:last-child ), .tabs:not (:last-child ), .title:not (:last-child
	){
	margin-bottom: 1.5rem
}

.delete, .modal-close {
	-moz-appearance: none;
	-webkit-appearance: none;
	background-color: rgba(0, 10, 18, .2);
	border: none;
	border-radius: 290486px;
	cursor: pointer;
	pointer-events: auto;
	display: inline-block;
	flex-grow: 0;
	flex-shrink: 0;
	font-size: 0;
	height: 20px;
	max-height: 20px;
	max-width: 20px;
	min-height: 20px;
	min-width: 20px;
	outline: none;
	position: relative;
	vertical-align: top;
	width: 20px
}

.delete:after, .delete:before, .modal-close:after, .modal-close:before {
	background-color: #fff;
	content: "";
	display: block;
	left: 50%;
	position: absolute;
	top: 50%;
	transform: translateX(-50%) translateY(-50%) rotate(45deg);
	transform-origin: center center
}

.delete:before, .modal-close:before {
	height: 2px;
	width: 50%
}

.delete:after, .modal-close:after {
	height: 50%;
	width: 2px
}

.delete:focus, .delete:hover, .modal-close:focus, .modal-close:hover {
	background-color: rgba(0, 10, 18, .3)
}

.delete:active, .modal-close:active {
	background-color: rgba(0, 10, 18, .4)
}

.is-small.delete, .is-small.modal-close {
	height: 16px;
	max-height: 16px;
	max-width: 16px;
	min-height: 16px;
	min-width: 16px;
	width: 16px
}

.is-medium.delete, .is-medium.modal-close {
	height: 24px;
	max-height: 24px;
	max-width: 24px;
	min-height: 24px;
	min-width: 24px;
	width: 24px
}

.is-large.delete, .is-large.modal-close {
	height: 32px;
	max-height: 32px;
	max-width: 32px;
	min-height: 32px;
	min-width: 32px;
	width: 32px
}

.button.is-loading:after, .control.is-loading:after, .loader, .select.is-loading:after
	{
	-webkit-animation: spinAround .5s linear infinite;
	animation: spinAround .5s linear infinite;
	border-radius: 290486px;
	border-color: transparent transparent #dbdbdb #dbdbdb;
	border-style: solid;
	border-width: 2px;
	content: "";
	display: block;
	height: 1em;
	position: relative;
	width: 1em
}

.hero-video, .image.is-1by1 .has-ratio, .image.is-1by1 img, .image.is-1by2 .has-ratio,
	.image.is-1by2 img, .image.is-1by3 .has-ratio, .image.is-1by3 img,
	.image.is-2by1 .has-ratio, .image.is-2by1 img, .image.is-2by3 .has-ratio,
	.image.is-2by3 img, .image.is-3by1 .has-ratio, .image.is-3by1 img,
	.image.is-3by2 .has-ratio, .image.is-3by2 img, .image.is-3by4 .has-ratio,
	.image.is-3by4 img, .image.is-3by5 .has-ratio, .image.is-3by5 img,
	.image.is-4by3 .has-ratio, .image.is-4by3 img, .image.is-4by5 .has-ratio,
	.image.is-4by5 img, .image.is-5by3 .has-ratio, .image.is-5by3 img,
	.image.is-5by4 .has-ratio, .image.is-5by4 img, .image.is-9by16 .has-ratio,
	.image.is-9by16 img, .image.is-16by9 .has-ratio, .image.is-16by9 img,
	.image.is-square .has-ratio, .image.is-square img, .is-overlay,
	.is_thumbnail img, .modal, .modal-background {
	bottom: 0;
	left: 0;
	position: absolute;
	right: 0;
	top: 0
}

.button, .file-cta, .file-name, .input, .pagination-ellipsis,
	.pagination-link, .pagination-next, .pagination-previous, .select select,
	.textarea {
	-moz-appearance: none;
	-webkit-appearance: none;
	align-items: center;
	border: 1px solid transparent;
	border-radius: 4px;
	box-shadow: none;
	display: inline-flex;
	font-size: 1rem;
	height: 2.25em;
	justify-content: flex-start;
	line-height: 1.5;
	padding: calc(.375em - 1px) calc(.625em - 1px);
	position: relative;
	vertical-align: top
}

.button:active, .button:focus, .file-cta:active, .file-cta:focus,
	.file-name:active, .file-name:focus, .input:active, .input:focus,
	.is-active.button, .is-active.file-cta, .is-active.file-name,
	.is-active.input, .is-active.pagination-ellipsis, .is-active.pagination-link,
	.is-active.pagination-next, .is-active.pagination-previous, .is-active.textarea,
	.is-focused.button, .is-focused.file-cta, .is-focused.file-name,
	.is-focused.input, .is-focused.pagination-ellipsis, .is-focused.pagination-link,
	.is-focused.pagination-next, .is-focused.pagination-previous,
	.is-focused.textarea, .pagination-ellipsis:active, .pagination-ellipsis:focus,
	.pagination-link:active, .pagination-link:focus, .pagination-next:active,
	.pagination-next:focus, .pagination-previous:active,
	.pagination-previous:focus, .select select.is-active, .select select.is-focused,
	.select select:active, .select select:focus, .textarea:active,
	.textarea:focus {
	outline: none
}

.button[disabled], .file-cta[disabled], .file-name[disabled], .input[disabled],
	.pagination-ellipsis[disabled], .pagination-link[disabled],
	.pagination-next[disabled], .pagination-previous[disabled], .select fieldset[disabled] select,
	.select select[disabled], .textarea[disabled], fieldset[disabled] .button,
	fieldset[disabled] .file-cta, fieldset[disabled] .file-name, fieldset[disabled] .input,
	fieldset[disabled] .pagination-ellipsis, fieldset[disabled] .pagination-link,
	fieldset[disabled] .pagination-next, fieldset[disabled] .pagination-previous,
	fieldset[disabled] .select select, fieldset[disabled] .textarea {
	cursor: not-allowed
}
	/*! minireset.css v0.0.4 | MIT License | github.com/jgthms/minireset.css */
blockquote, body, dd, dl, dt, fieldset, figure, h1, h2, h3, h4, h5, h6,
	hr, html, iframe, legend, li, ol, p, pre, textarea, ul {
	margin: 0;
	padding: 0
}

h1, h2, h3, h4, h5, h6 {
	font-size: 100%;
	font-weight: 400
}

ul {
	list-style: none
}

button, input, select, textarea {
	margin: 0
}

embed, iframe, img, object, video {
	height: auto;
	max-width: 100%
}

audio {
	max-width: 100%
}

iframe {
	border: 0
}

table {
	border-collapse: collapse;
	border-spacing: 0
}

td, th {
	padding: 0;
	text-align: left
}

html {
	font-size: 16px;
	-moz-osx-font-smoothing: grayscale;
	-webkit-font-smoothing: antialiased;
	text-rendering: optimizeLegibility;
	text-size-adjust: 100%
}

article, aside, figure, footer, header, hgroup, section {
	display: block
}

body, button, input, select, textarea {
	font-family: Noto Sans KR, -apple-system, "system-ui",
		BlinkMacSystemFont, Apple SD Gothic Neo, Segoe UI, Roboto,
		Helvetica Neue, Arial, sans-serif, Oxygen, Ubuntu, Cantarell,
		Fira Sans, Droid Sans, Helvetica
}

code, pre {
	-moz-osx-font-smoothing: auto;
	-webkit-font-smoothing: auto;
	font-family: monospace
}

body {
	color: #454545;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5
}

a {
	color: #1dc078
}

a:hover {
	color: #363636
}

code {
	color: #f14668;
	font-size: .875em;
	font-weight: 400;
	padding: .25em .5em
}

code, hr {
	background-color: #fff
}

hr {
	border: none;
	display: block;
	height: 2px;
	margin: 1.5rem 0
}

img {
	height: auto
}

input[type=checkbox], input[type=radio] {
	vertical-align: baseline
}

strong {
	color: #363636
}

fieldset {
	border: none
}

pre {
	-webkit-overflow-scrolling: touch;
	background-color: #fff;
	color: #454545;
	font-size: .875em;
	overflow-x: auto;
	padding: 1.25rem 1.5rem;
	white-space: pre;
	word-wrap: normal
}

pre code {
	background-color: transparent;
	color: currentColor;
	font-size: 1em;
	padding: 0
}

table td, table th {
	text-align: left;
	vertical-align: top
}

table th {
	color: #363636
}

.is-clearfix:after {
	clear: both;
	content: " ";
	display: table
}

.is-pulled-left {
	float: left !important
}

.is-pulled-right {
	float: right !important
}

.is-clipped {
	overflow: hidden !important
}

.is-size-1 {
	font-size: 2.75rem !important
}

.is-size-2 {
	font-size: 2.25rem !important
}

.is-size-3 {
	font-size: 2rem !important
}

.is-size-4 {
	font-size: 1.5rem !important
}

.is-size-5 {
	font-size: 1.375rem !important
}

.is-size-6 {
	font-size: 1.25rem !important
}

.is-size-7 {
	font-size: 1.125rem !important
}

@media screen and (max-width:768px) {
	.is-size-1-mobile {
		font-size: 2.75rem !important
	}
	.is-size-2-mobile {
		font-size: 2.25rem !important
	}
	.is-size-3-mobile {
		font-size: 2rem !important
	}
	.is-size-4-mobile {
		font-size: 1.5rem !important
	}
	.is-size-5-mobile {
		font-size: 1.375rem !important
	}
	.is-size-6-mobile {
		font-size: 1.25rem !important
	}
	.is-size-7-mobile {
		font-size: 1.125rem !important
	}
}

@media print , screen and (min-width:769px) {
	.is-size-1-tablet {
		font-size: 2.75rem !important
	}
	.is-size-2-tablet {
		font-size: 2.25rem !important
	}
	.is-size-3-tablet {
		font-size: 2rem !important
	}
	.is-size-4-tablet {
		font-size: 1.5rem !important
	}
	.is-size-5-tablet {
		font-size: 1.375rem !important
	}
	.is-size-6-tablet {
		font-size: 1.25rem !important
	}
	.is-size-7-tablet {
		font-size: 1.125rem !important
	}
}

@media screen and (max-width:1199px) {
	.is-size-1-touch {
		font-size: 2.75rem !important
	}
	.is-size-2-touch {
		font-size: 2.25rem !important
	}
	.is-size-3-touch {
		font-size: 2rem !important
	}
	.is-size-4-touch {
		font-size: 1.5rem !important
	}
	.is-size-5-touch {
		font-size: 1.375rem !important
	}
	.is-size-6-touch {
		font-size: 1.25rem !important
	}
	.is-size-7-touch {
		font-size: 1.125rem !important
	}
}

@media screen and (min-width:1200px) {
	.is-size-1-desktop {
		font-size: 2.75rem !important
	}
	.is-size-2-desktop {
		font-size: 2.25rem !important
	}
	.is-size-3-desktop {
		font-size: 2rem !important
	}
	.is-size-4-desktop {
		font-size: 1.5rem !important
	}
	.is-size-5-desktop {
		font-size: 1.375rem !important
	}
	.is-size-6-desktop {
		font-size: 1.25rem !important
	}
	.is-size-7-desktop {
		font-size: 1.125rem !important
	}
}

.has-text-centered {
	text-align: center !important
}

.has-text-justified {
	text-align: justify !important
}

.has-text-left {
	text-align: left !important
}

.has-text-right {
	text-align: right !important
}

@media screen and (max-width:768px) {
	.has-text-centered-mobile {
		text-align: center !important
	}
}

@media print , screen and (min-width:769px) {
	.has-text-centered-tablet {
		text-align: center !important
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.has-text-centered-tablet-only {
		text-align: center !important
	}
}

@media screen and (max-width:1199px) {
	.has-text-centered-touch {
		text-align: center !important
	}
}

@media screen and (min-width:1200px) {
	.has-text-centered-desktop {
		text-align: center !important
	}
}

@media screen and (max-width:768px) {
	.has-text-justified-mobile {
		text-align: justify !important
	}
}

@media print , screen and (min-width:769px) {
	.has-text-justified-tablet {
		text-align: justify !important
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.has-text-justified-tablet-only {
		text-align: justify !important
	}
}

@media screen and (max-width:1199px) {
	.has-text-justified-touch {
		text-align: justify !important
	}
}

@media screen and (min-width:1200px) {
	.has-text-justified-desktop {
		text-align: justify !important
	}
}

@media screen and (max-width:768px) {
	.has-text-left-mobile {
		text-align: left !important
	}
}

@media print , screen and (min-width:769px) {
	.has-text-left-tablet {
		text-align: left !important
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.has-text-left-tablet-only {
		text-align: left !important
	}
}

@media screen and (max-width:1199px) {
	.has-text-left-touch {
		text-align: left !important
	}
}

@media screen and (min-width:1200px) {
	.has-text-left-desktop {
		text-align: left !important
	}
}

@media screen and (max-width:768px) {
	.has-text-right-mobile {
		text-align: right !important
	}
}

@media print , screen and (min-width:769px) {
	.has-text-right-tablet {
		text-align: right !important
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.has-text-right-tablet-only {
		text-align: right !important
	}
}

@media screen and (max-width:1199px) {
	.has-text-right-touch {
		text-align: right !important
	}
}

@media screen and (min-width:1200px) {
	.has-text-right-desktop {
		text-align: right !important
	}
}

.is-capitalized {
	text-transform: capitalize !important
}

.is-lowercase {
	text-transform: lowercase !important
}

.is-uppercase {
	text-transform: uppercase !important
}

.is-italic {
	font-style: italic !important
}

.has-text-white {
	color: #fff !important
}

a.has-text-white:focus, a.has-text-white:hover {
	color: #e6e6e6 !important
}

.has-background-white {
	background-color: #fff !important
}

.has-text-black {
	color: #000a12 !important
}

a.has-text-black:focus, a.has-text-black:hover {
	color: #000 !important
}

.has-background-black {
	background-color: #000a12 !important
}

.has-text-light {
	color: #f5f5f5 !important
}

a.has-text-light:focus, a.has-text-light:hover {
	color: #dbdbdb !important
}

.has-background-light {
	background-color: #f5f5f5 !important
}

.has-text-dark {
	color: #363636 !important
}

a.has-text-dark:focus, a.has-text-dark:hover {
	color: #1c1c1c !important
}

.has-background-dark {
	background-color: #363636 !important
}

.has-text-primary {
	color: #ff7867 !important
}

a.has-text-primary:focus, a.has-text-primary:hover {
	color: #ff4b34 !important
}

.has-background-primary {
	background-color: #ff7867 !important
}

.has-text-link {
	color: #1dc078 !important
}

a.has-text-link:focus, a.has-text-link:hover {
	color: #16945c !important
}

.has-background-link {
	background-color: #1dc078 !important
}

.has-text-info {
	color: #3298dc !important
}

a.has-text-info:focus, a.has-text-info:hover {
	color: #207dbc !important
}

.has-background-info {
	background-color: #3298dc !important
}

.has-text-success {
	color: #5eceb3 !important
}

a.has-text-success:focus, a.has-text-success:hover {
	color: #3abf9f !important
}

.has-background-success {
	background-color: #5eceb3 !important
}

.has-text-warning {
	color: #ffdd57 !important
}

a.has-text-warning:focus, a.has-text-warning:hover {
	color: #ffd324 !important
}

.has-background-warning {
	background-color: #ffdd57 !important
}

.has-text-danger {
	color: #f14668 !important
}

a.has-text-danger:focus, a.has-text-danger:hover {
	color: #ee1742 !important
}

.has-background-danger {
	background-color: #f14668 !important
}

.has-text-black-bis {
	color: #454545 !important
}

.has-background-black-bis {
	background-color: #454545 !important
}

.has-text-black-ter {
	color: #242424 !important
}

.has-background-black-ter {
	background-color: #242424 !important
}

.has-text-grey-darker {
	color: #363636 !important
}

.has-background-grey-darker {
	background-color: #363636 !important
}

.has-text-grey-dark {
	color: #4a4a4a !important
}

.has-background-grey-dark {
	background-color: #4a4a4a !important
}

.has-text-grey {
	color: #cfcfcf !important
}

.has-background-grey {
	background-color: #cfcfcf !important
}

.has-text-grey-light {
	color: #b5b5b5 !important
}

.has-background-grey-light {
	background-color: #b5b5b5 !important
}

.has-text-grey-lighter {
	color: #dbdbdb !important
}

.has-background-grey-lighter {
	background-color: #dbdbdb !important
}

.has-text-white-ter {
	color: #f5f5f5 !important
}

.has-background-white-ter {
	background-color: #f5f5f5 !important
}

.has-text-white-bis {
	color: #fafafa !important
}

.has-background-white-bis {
	background-color: #fafafa !important
}

.has-text-weight-light {
	font-weight: 300 !important
}

.has-text-weight-normal {
	font-weight: 400 !important
}

.has-text-weight-semibold {
	font-weight: 600 !important
}

.has-text-weight-bold {
	font-weight: 700 !important
}

.is-family-primary, .is-family-sans-serif, .is-family-secondary {
	font-family: Noto Sans KR, -apple-system, "system-ui",
		BlinkMacSystemFont, Apple SD Gothic Neo, Segoe UI, Roboto,
		Helvetica Neue, Arial, sans-serif, Oxygen, Ubuntu, Cantarell,
		Fira Sans, Droid Sans, Helvetica !important
}

.is-family-code, .is-family-monospace {
	font-family: monospace !important
}

.is-block {
	display: block !important
}

@media screen and (max-width:768px) {
	.is-block-mobile {
		display: block !important
	}
}

@media print , screen and (min-width:769px) {
	.is-block-tablet {
		display: block !important
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.is-block-tablet-only {
		display: block !important
	}
}

@media screen and (max-width:1199px) {
	.is-block-touch {
		display: block !important
	}
}

@media screen and (min-width:1200px) {
	.is-block-desktop {
		display: block !important
	}
}

.is-flex {
	display: flex !important
}

@media screen and (max-width:768px) {
	.is-flex-mobile {
		display: flex !important
	}
}

@media print , screen and (min-width:769px) {
	.is-flex-tablet {
		display: flex !important
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.is-flex-tablet-only {
		display: flex !important
	}
}

@media screen and (max-width:1199px) {
	.is-flex-touch {
		display: flex !important
	}
}

@media screen and (min-width:1200px) {
	.is-flex-desktop {
		display: flex !important
	}
}

.is-inline {
	display: inline !important
}

@media screen and (max-width:768px) {
	.is-inline-mobile {
		display: inline !important
	}
}

@media print , screen and (min-width:769px) {
	.is-inline-tablet {
		display: inline !important
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.is-inline-tablet-only {
		display: inline !important
	}
}

@media screen and (max-width:1199px) {
	.is-inline-touch {
		display: inline !important
	}
}

@media screen and (min-width:1200px) {
	.is-inline-desktop {
		display: inline !important
	}
}

.is-inline-block {
	display: inline-block !important
}

@media screen and (max-width:768px) {
	.is-inline-block-mobile {
		display: inline-block !important
	}
}

@media print , screen and (min-width:769px) {
	.is-inline-block-tablet {
		display: inline-block !important
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.is-inline-block-tablet-only {
		display: inline-block !important
	}
}

@media screen and (max-width:1199px) {
	.is-inline-block-touch {
		display: inline-block !important
	}
}

@media screen and (min-width:1200px) {
	.is-inline-block-desktop {
		display: inline-block !important
	}
}

.is-inline-flex {
	display: inline-flex !important
}

@media screen and (max-width:768px) {
	.is-inline-flex-mobile {
		display: inline-flex !important
	}
}

@media print , screen and (min-width:769px) {
	.is-inline-flex-tablet {
		display: inline-flex !important
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.is-inline-flex-tablet-only {
		display: inline-flex !important
	}
}

@media screen and (max-width:1199px) {
	.is-inline-flex-touch {
		display: inline-flex !important
	}
}

@media screen and (min-width:1200px) {
	.is-inline-flex-desktop {
		display: inline-flex !important
	}
}

.is-hidden {
	display: none !important
}

.is-sr-only {
	border: none !important;
	clip: rect(0, 0, 0, 0) !important;
	height: .01em !important;
	overflow: hidden !important;
	padding: 0 !important;
	position: absolute !important;
	white-space: nowrap !important;
	width: .01em !important
}

@media screen and (max-width:768px) {
	.is-hidden-mobile {
		display: none !important
	}
}

@media print , screen and (min-width:769px) {
	.is-hidden-tablet {
		display: none !important
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.is-hidden-tablet-only {
		display: none !important
	}
}

@media screen and (max-width:1199px) {
	.is-hidden-touch {
		display: none !important
	}
}

@media screen and (min-width:1200px) {
	.is-hidden-desktop {
		display: none !important
	}
}

.is-invisible {
	visibility: hidden !important
}

@media screen and (max-width:768px) {
	.is-invisible-mobile {
		visibility: hidden !important
	}
}

@media print , screen and (min-width:769px) {
	.is-invisible-tablet {
		visibility: hidden !important
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.is-invisible-tablet-only {
		visibility: hidden !important
	}
}

@media screen and (max-width:1199px) {
	.is-invisible-touch {
		visibility: hidden !important
	}
}

@media screen and (min-width:1200px) {
	.is-invisible-desktop {
		visibility: hidden !important
	}
}

.is-marginless {
	margin: 0 !important
}

.is-paddingless {
	padding: 0 !important
}

.is-radiusless {
	border-radius: 0 !important
}

.is-shadowless {
	box-shadow: none !important
}

.box {
	border-radius: 6px;
	box-shadow: 0 2px 3px rgba(0, 10, 18, .1), 0 0 0 1px rgba(0, 10, 18, .1);
	color: #454545;
	display: block;
	padding: 1.25rem
}

a.box:focus, a.box:hover {
	box-shadow: 0 2px 3px rgba(0, 10, 18, .1), 0 0 0 1px #1dc078
}

a.box:active {
	box-shadow: inset 0 1px 2px rgba(0, 10, 18, .2), 0 0 0 1px #1dc078
}

.button {
	background-color: #fff;
	border-color: #dbdbdb;
	border-width: 1px;
	color: #363636;
	cursor: pointer;
	justify-content: center;
	padding: calc(.375em - 1px) .75em;
	text-align: center;
	white-space: nowrap
}

.button strong {
	color: inherit
}

.button .icon, .button .icon.is-large, .button .icon.is-medium, .button .icon.is-small
	{
	height: 1.5em;
	width: 1.5em
}

.button .icon:first-child:not (:last-child ){
	margin-left: calc(-.375em - 1px);
	margin-right: .1875em
}

.button .icon:last-child:not (:first-child ){
	margin-left: .1875em;
	margin-right: calc(-.375em - 1px)
}

.button .icon:first-child:last-child {
	margin-left: calc(-.375em - 1px);
	margin-right: calc(-.375em - 1px)
}

.button.is-hovered, .button:hover {
	border-color: #b5b5b5;
	color: #363636
}

.button.is-focused, .button:focus {
	border-color: #3273dc;
	color: #363636
}

.button.is-focused:not (:active ), .button:focus:not (:active ){
	box-shadow: 0 0 0 .125em rgba(29, 192, 120, .25)
}

.button.is-active, .button:active {
	border-color: #4a4a4a;
	color: #363636
}

.button.is-text {
	background-color: transparent;
	border-color: transparent;
	color: #454545;
	text-decoration: underline
}

.button.is-text.is-focused, .button.is-text.is-hovered, .button.is-text:focus,
	.button.is-text:hover {
	background-color: #fff;
	color: #363636
}

.button.is-text.is-active, .button.is-text:active {
	background-color: #f2f2f2;
	color: #363636
}

.button.is-text[disabled], fieldset[disabled] .button.is-text {
	background-color: transparent;
	border-color: transparent;
	box-shadow: none
}

.button.is-white {
	background-color: #fff;
	border-color: transparent;
	color: #000a12
}

.button.is-white.is-hovered, .button.is-white:hover {
	background-color: #f9f9f9;
	border-color: transparent;
	color: #000a12
}

.button.is-white.is-focused, .button.is-white:focus {
	border-color: transparent;
	color: #000a12
}

.button.is-white.is-focused:not (:active ), .button.is-white:focus:not (:active
	){
	box-shadow: 0 0 0 .125em hsla(0, 0%, 100%, .25)
}

.button.is-white.is-active, .button.is-white:active {
	background-color: #f2f2f2;
	border-color: transparent;
	color: #000a12
}

.button.is-white[disabled], fieldset[disabled] .button.is-white {
	background-color: #fff;
	border-color: transparent;
	box-shadow: none
}

.button.is-white.is-inverted {
	background-color: #000a12;
	color: #fff
}

.button.is-white.is-inverted:hover {
	background-color: #000
}

.button.is-white.is-inverted[disabled], fieldset[disabled] .button.is-white.is-inverted
	{
	background-color: #000a12;
	border-color: transparent;
	box-shadow: none;
	color: #fff
}

.button.is-white.is-loading:after {
	border-color: transparent transparent #000a12 #000a12 !important
}

.button.is-white.is-outlined {
	background-color: transparent;
	border-color: #fff;
	color: #fff
}

.button.is-white.is-outlined:focus, .button.is-white.is-outlined:hover {
	background-color: #fff;
	border-color: #fff;
	color: #000a12
}

.button.is-white.is-outlined.is-loading:after {
	border-color: transparent transparent #fff #fff !important
}

.button.is-white.is-outlined[disabled], fieldset[disabled] .button.is-white.is-outlined
	{
	background-color: transparent;
	border-color: #fff;
	box-shadow: none;
	color: #fff
}

.button.is-white.is-inverted.is-outlined {
	background-color: transparent;
	border-color: #000a12;
	color: #000a12
}

.button.is-white.is-inverted.is-outlined:focus, .button.is-white.is-inverted.is-outlined:hover
	{
	background-color: #000a12;
	color: #fff
}

.button.is-white.is-inverted.is-outlined[disabled], fieldset[disabled] .button.is-white.is-inverted.is-outlined
	{
	background-color: transparent;
	border-color: #000a12;
	box-shadow: none;
	color: #000a12
}

.button.is-black {
	background-color: #000a12;
	border-color: transparent;
	color: #fff
}

.button.is-black.is-hovered, .button.is-black:hover {
	background-color: #000305;
	border-color: transparent;
	color: #fff
}

.button.is-black.is-focused, .button.is-black:focus {
	border-color: transparent;
	color: #fff
}

.button.is-black.is-focused:not (:active ), .button.is-black:focus:not (:active
	){
	box-shadow: 0 0 0 .125em rgba(0, 10, 18, .25)
}

.button.is-black.is-active, .button.is-black:active {
	background-color: #000;
	border-color: transparent;
	color: #fff
}

.button.is-black[disabled], fieldset[disabled] .button.is-black {
	background-color: #000a12;
	border-color: transparent;
	box-shadow: none
}

.button.is-black.is-inverted {
	background-color: #fff;
	color: #000a12
}

.button.is-black.is-inverted:hover {
	background-color: #f2f2f2
}

.button.is-black.is-inverted[disabled], fieldset[disabled] .button.is-black.is-inverted
	{
	background-color: #fff;
	border-color: transparent;
	box-shadow: none;
	color: #000a12
}

.button.is-black.is-loading:after {
	border-color: transparent transparent #fff #fff !important
}

.button.is-black.is-outlined {
	background-color: transparent;
	border-color: #000a12;
	color: #000a12
}

.button.is-black.is-outlined:focus, .button.is-black.is-outlined:hover {
	background-color: #000a12;
	border-color: #000a12;
	color: #fff
}

.button.is-black.is-outlined.is-loading:after {
	border-color: transparent transparent #000a12 #000a12 !important
}

.button.is-black.is-outlined[disabled], fieldset[disabled] .button.is-black.is-outlined
	{
	background-color: transparent;
	border-color: #000a12;
	box-shadow: none;
	color: #000a12
}

.button.is-black.is-inverted.is-outlined {
	background-color: transparent;
	border-color: #fff;
	color: #fff
}

.button.is-black.is-inverted.is-outlined:focus, .button.is-black.is-inverted.is-outlined:hover
	{
	background-color: #fff;
	color: #000a12
}

.button.is-black.is-inverted.is-outlined[disabled], fieldset[disabled] .button.is-black.is-inverted.is-outlined
	{
	background-color: transparent;
	border-color: #fff;
	box-shadow: none;
	color: #fff
}

.button.is-light {
	background-color: #f5f5f5;
	border-color: transparent;
	color: #363636
}

.button.is-light.is-hovered, .button.is-light:hover {
	background-color: #eee;
	border-color: transparent;
	color: #363636
}

.button.is-light.is-focused, .button.is-light:focus {
	border-color: transparent;
	color: #363636
}

.button.is-light.is-focused:not (:active ), .button.is-light:focus:not (:active
	){
	box-shadow: 0 0 0 .125em hsla(0, 0%, 96.1%, .25)
}

.button.is-light.is-active, .button.is-light:active {
	background-color: #e8e8e8;
	border-color: transparent;
	color: #363636
}

.button.is-light[disabled], fieldset[disabled] .button.is-light {
	background-color: #f5f5f5;
	border-color: transparent;
	box-shadow: none
}

.button.is-light.is-inverted {
	background-color: #363636;
	color: #f5f5f5
}

.button.is-light.is-inverted:hover {
	background-color: #292929
}

.button.is-light.is-inverted[disabled], fieldset[disabled] .button.is-light.is-inverted
	{
	background-color: #363636;
	border-color: transparent;
	box-shadow: none;
	color: #f5f5f5
}

.button.is-light.is-loading:after {
	border-color: transparent transparent #363636 #363636 !important
}

.button.is-light.is-outlined {
	background-color: transparent;
	border-color: #f5f5f5;
	color: #f5f5f5
}

.button.is-light.is-outlined:focus, .button.is-light.is-outlined:hover {
	background-color: #f5f5f5;
	border-color: #f5f5f5;
	color: #363636
}

.button.is-light.is-outlined.is-loading:after {
	border-color: transparent transparent #f5f5f5 #f5f5f5 !important
}

.button.is-light.is-outlined[disabled], fieldset[disabled] .button.is-light.is-outlined
	{
	background-color: transparent;
	border-color: #f5f5f5;
	box-shadow: none;
	color: #f5f5f5
}

.button.is-light.is-inverted.is-outlined {
	background-color: transparent;
	border-color: #363636;
	color: #363636
}

.button.is-light.is-inverted.is-outlined:focus, .button.is-light.is-inverted.is-outlined:hover
	{
	background-color: #363636;
	color: #f5f5f5
}

.button.is-light.is-inverted.is-outlined[disabled], fieldset[disabled] .button.is-light.is-inverted.is-outlined
	{
	background-color: transparent;
	border-color: #363636;
	box-shadow: none;
	color: #363636
}

.button.is-dark {
	background-color: #363636;
	border-color: transparent;
	color: #f5f5f5
}

.button.is-dark.is-hovered, .button.is-dark:hover {
	background-color: #2f2f2f;
	border-color: transparent;
	color: #f5f5f5
}

.button.is-dark.is-focused, .button.is-dark:focus {
	border-color: transparent;
	color: #f5f5f5
}

.button.is-dark.is-focused:not (:active ), .button.is-dark:focus:not (:active
	){
	box-shadow: 0 0 0 .125em rgba(54, 54, 54, .25)
}

.button.is-dark.is-active, .button.is-dark:active {
	background-color: #292929;
	border-color: transparent;
	color: #f5f5f5
}

.button.is-dark[disabled], fieldset[disabled] .button.is-dark {
	background-color: #363636;
	border-color: transparent;
	box-shadow: none
}

.button.is-dark.is-inverted {
	background-color: #f5f5f5;
	color: #363636
}

.button.is-dark.is-inverted:hover {
	background-color: #e8e8e8
}

.button.is-dark.is-inverted[disabled], fieldset[disabled] .button.is-dark.is-inverted
	{
	background-color: #f5f5f5;
	border-color: transparent;
	box-shadow: none;
	color: #363636
}

.button.is-dark.is-loading:after {
	border-color: transparent transparent #f5f5f5 #f5f5f5 !important
}

.button.is-dark.is-outlined {
	background-color: transparent;
	border-color: #363636;
	color: #363636
}

.button.is-dark.is-outlined:focus, .button.is-dark.is-outlined:hover {
	background-color: #363636;
	border-color: #363636;
	color: #f5f5f5
}

.button.is-dark.is-outlined.is-loading:after {
	border-color: transparent transparent #363636 #363636 !important
}

.button.is-dark.is-outlined[disabled], fieldset[disabled] .button.is-dark.is-outlined
	{
	background-color: transparent;
	border-color: #363636;
	box-shadow: none;
	color: #363636
}

.button.is-dark.is-inverted.is-outlined {
	background-color: transparent;
	border-color: #f5f5f5;
	color: #f5f5f5
}

.button.is-dark.is-inverted.is-outlined:focus, .button.is-dark.is-inverted.is-outlined:hover
	{
	background-color: #f5f5f5;
	color: #363636
}

.button.is-dark.is-inverted.is-outlined[disabled], fieldset[disabled] .button.is-dark.is-inverted.is-outlined
	{
	background-color: transparent;
	border-color: #f5f5f5;
	box-shadow: none;
	color: #f5f5f5
}

.button.is-primary {
	background-color: #ff7867;
	border-color: transparent;
	color: #fff
}

.button.is-primary.is-hovered, .button.is-primary:hover {
	background-color: #ff6d5a;
	border-color: transparent;
	color: #fff
}

.button.is-primary.is-focused, .button.is-primary:focus {
	border-color: transparent;
	color: #fff
}

.button.is-primary.is-focused:not (:active ), .button.is-primary:focus:not
	(:active ){
	box-shadow: 0 0 0 .125em rgba(255, 120, 103, .25)
}

.button.is-primary.is-active, .button.is-primary:active {
	background-color: #ff614e;
	border-color: transparent;
	color: #fff
}

.button.is-primary[disabled], fieldset[disabled] .button.is-primary {
	background-color: #ff7867;
	border-color: transparent;
	box-shadow: none
}

.button.is-primary.is-inverted {
	background-color: #fff;
	color: #ff7867
}

.button.is-primary.is-inverted:hover {
	background-color: #f2f2f2
}

.button.is-primary.is-inverted[disabled], fieldset[disabled] .button.is-primary.is-inverted
	{
	background-color: #fff;
	border-color: transparent;
	box-shadow: none;
	color: #ff7867
}

.button.is-primary.is-loading:after {
	border-color: transparent transparent #fff #fff !important
}

.button.is-primary.is-outlined {
	background-color: transparent;
	border-color: #ff7867;
	color: #ff7867
}

.button.is-primary.is-outlined:focus, .button.is-primary.is-outlined:hover
	{
	background-color: #ff7867;
	border-color: #ff7867;
	color: #fff
}

.button.is-primary.is-outlined.is-loading:after {
	border-color: transparent transparent #ff7867 #ff7867 !important
}

.button.is-primary.is-outlined[disabled], fieldset[disabled] .button.is-primary.is-outlined
	{
	background-color: transparent;
	border-color: #ff7867;
	box-shadow: none;
	color: #ff7867
}

.button.is-primary.is-inverted.is-outlined {
	background-color: transparent;
	border-color: #fff;
	color: #fff
}

.button.is-primary.is-inverted.is-outlined:focus, .button.is-primary.is-inverted.is-outlined:hover
	{
	background-color: #fff;
	color: #ff7867
}

.button.is-primary.is-inverted.is-outlined[disabled], fieldset[disabled] .button.is-primary.is-inverted.is-outlined
	{
	background-color: transparent;
	border-color: #fff;
	box-shadow: none;
	color: #fff
}

.button.is-link {
	background-color: #1dc078;
	border-color: transparent;
	color: #fff
}

.button.is-link.is-hovered, .button.is-link:hover {
	background-color: #1bb571;
	border-color: transparent;
	color: #fff
}

.button.is-link.is-focused, .button.is-link:focus {
	border-color: transparent;
	color: #fff
}

.button.is-link.is-focused:not (:active ), .button.is-link:focus:not (:active
	){
	box-shadow: 0 0 0 .125em rgba(29, 192, 120, .25)
}

.button.is-link.is-active, .button.is-link:active {
	background-color: #1aaa6a;
	border-color: transparent;
	color: #fff
}

.button.is-link[disabled], fieldset[disabled] .button.is-link {
	background-color: #1dc078;
	border-color: transparent;
	box-shadow: none
}

.button.is-link.is-inverted {
	background-color: #fff;
	color: #1dc078
}

.button.is-link.is-inverted:hover {
	background-color: #f2f2f2
}

.button.is-link.is-inverted[disabled], fieldset[disabled] .button.is-link.is-inverted
	{
	background-color: #fff;
	border-color: transparent;
	box-shadow: none;
	color: #1dc078
}

.button.is-link.is-loading:after {
	border-color: transparent transparent #fff #fff !important
}

.button.is-link.is-outlined {
	background-color: transparent;
	border-color: #1dc078;
	color: #1dc078
}

.button.is-link.is-outlined:focus, .button.is-link.is-outlined:hover {
	background-color: #1dc078;
	border-color: #1dc078;
	color: #fff
}

.button.is-link.is-outlined.is-loading:after {
	border-color: transparent transparent #1dc078 #1dc078 !important
}

.button.is-link.is-outlined[disabled], fieldset[disabled] .button.is-link.is-outlined
	{
	background-color: transparent;
	border-color: #1dc078;
	box-shadow: none;
	color: #1dc078
}

.button.is-link.is-inverted.is-outlined {
	background-color: transparent;
	border-color: #fff;
	color: #fff
}

.button.is-link.is-inverted.is-outlined:focus, .button.is-link.is-inverted.is-outlined:hover
	{
	background-color: #fff;
	color: #1dc078
}

.button.is-link.is-inverted.is-outlined[disabled], fieldset[disabled] .button.is-link.is-inverted.is-outlined
	{
	background-color: transparent;
	border-color: #fff;
	box-shadow: none;
	color: #fff
}

.button.is-info {
	background-color: #3298dc;
	border-color: transparent;
	color: #fff
}

.button.is-info.is-hovered, .button.is-info:hover {
	background-color: #2793da;
	border-color: transparent;
	color: #fff
}

.button.is-info.is-focused, .button.is-info:focus {
	border-color: transparent;
	color: #fff
}

.button.is-info.is-focused:not (:active ), .button.is-info:focus:not (:active
	){
	box-shadow: 0 0 0 .125em rgba(50, 152, 220, .25)
}

.button.is-info.is-active, .button.is-info:active {
	background-color: #238cd1;
	border-color: transparent;
	color: #fff
}

.button.is-info[disabled], fieldset[disabled] .button.is-info {
	background-color: #3298dc;
	border-color: transparent;
	box-shadow: none
}

.button.is-info.is-inverted {
	background-color: #fff;
	color: #3298dc
}

.button.is-info.is-inverted:hover {
	background-color: #f2f2f2
}

.button.is-info.is-inverted[disabled], fieldset[disabled] .button.is-info.is-inverted
	{
	background-color: #fff;
	border-color: transparent;
	box-shadow: none;
	color: #3298dc
}

.button.is-info.is-loading:after {
	border-color: transparent transparent #fff #fff !important
}

.button.is-info.is-outlined {
	background-color: transparent;
	border-color: #3298dc;
	color: #3298dc
}

.button.is-info.is-outlined:focus, .button.is-info.is-outlined:hover {
	background-color: #3298dc;
	border-color: #3298dc;
	color: #fff
}

.button.is-info.is-outlined.is-loading:after {
	border-color: transparent transparent #3298dc #3298dc !important
}

.button.is-info.is-outlined[disabled], fieldset[disabled] .button.is-info.is-outlined
	{
	background-color: transparent;
	border-color: #3298dc;
	box-shadow: none;
	color: #3298dc
}

.button.is-info.is-inverted.is-outlined {
	background-color: transparent;
	border-color: #fff;
	color: #fff
}

.button.is-info.is-inverted.is-outlined:focus, .button.is-info.is-inverted.is-outlined:hover
	{
	background-color: #fff;
	color: #3298dc
}

.button.is-info.is-inverted.is-outlined[disabled], fieldset[disabled] .button.is-info.is-inverted.is-outlined
	{
	background-color: transparent;
	border-color: #fff;
	box-shadow: none;
	color: #fff
}

.button.is-success {
	background-color: #5eceb3;
	border-color: transparent;
	color: #fff
}

.button.is-success.is-hovered, .button.is-success:hover {
	background-color: #54cbae;
	border-color: transparent;
	color: #fff
}

.button.is-success.is-focused, .button.is-success:focus {
	border-color: transparent;
	color: #fff
}

.button.is-success.is-focused:not (:active ), .button.is-success:focus:not
	(:active ){
	box-shadow: 0 0 0 .125em rgba(94, 206, 179, .25)
}

.button.is-success.is-active, .button.is-success:active {
	background-color: #4ac8aa;
	border-color: transparent;
	color: #fff
}

.button.is-success[disabled], fieldset[disabled] .button.is-success {
	background-color: #5eceb3;
	border-color: transparent;
	box-shadow: none
}

.button.is-success.is-inverted {
	background-color: #fff;
	color: #5eceb3
}

.button.is-success.is-inverted:hover {
	background-color: #f2f2f2
}

.button.is-success.is-inverted[disabled], fieldset[disabled] .button.is-success.is-inverted
	{
	background-color: #fff;
	border-color: transparent;
	box-shadow: none;
	color: #5eceb3
}

.button.is-success.is-loading:after {
	border-color: transparent transparent #fff #fff !important
}

.button.is-success.is-outlined {
	background-color: transparent;
	border-color: #5eceb3;
	color: #5eceb3
}

.button.is-success.is-outlined:focus, .button.is-success.is-outlined:hover
	{
	background-color: #5eceb3;
	border-color: #5eceb3;
	color: #fff
}

.button.is-success.is-outlined.is-loading:after {
	border-color: transparent transparent #5eceb3 #5eceb3 !important
}

.button.is-success.is-outlined[disabled], fieldset[disabled] .button.is-success.is-outlined
	{
	background-color: transparent;
	border-color: #5eceb3;
	box-shadow: none;
	color: #5eceb3
}

.button.is-success.is-inverted.is-outlined {
	background-color: transparent;
	border-color: #fff;
	color: #fff
}

.button.is-success.is-inverted.is-outlined:focus, .button.is-success.is-inverted.is-outlined:hover
	{
	background-color: #fff;
	color: #5eceb3
}

.button.is-success.is-inverted.is-outlined[disabled], fieldset[disabled] .button.is-success.is-inverted.is-outlined
	{
	background-color: transparent;
	border-color: #fff;
	box-shadow: none;
	color: #fff
}

.button.is-warning {
	background-color: #ffdd57;
	border-color: transparent;
	color: rgba(0, 0, 0, .7)
}

.button.is-warning.is-hovered, .button.is-warning:hover {
	background-color: #ffdb4a;
	border-color: transparent;
	color: rgba(0, 0, 0, .7)
}

.button.is-warning.is-focused, .button.is-warning:focus {
	border-color: transparent;
	color: rgba(0, 0, 0, .7)
}

.button.is-warning.is-focused:not (:active ), .button.is-warning:focus:not
	(:active ){
	box-shadow: 0 0 0 .125em rgba(255, 221, 87, .25)
}

.button.is-warning.is-active, .button.is-warning:active {
	background-color: #ffd83d;
	border-color: transparent;
	color: rgba(0, 0, 0, .7)
}

.button.is-warning[disabled], fieldset[disabled] .button.is-warning {
	background-color: #ffdd57;
	border-color: transparent;
	box-shadow: none
}

.button.is-warning.is-inverted {
	background-color: rgba(0, 0, 0, .7);
	color: #ffdd57
}

.button.is-warning.is-inverted:hover {
	background-color: rgba(0, 0, 0, .7)
}

.button.is-warning.is-inverted[disabled], fieldset[disabled] .button.is-warning.is-inverted
	{
	background-color: rgba(0, 0, 0, .7);
	border-color: transparent;
	box-shadow: none;
	color: #ffdd57
}

.button.is-warning.is-loading:after {
	border-color: transparent transparent rgba(0, 0, 0, .7)
		rgba(0, 0, 0, .7) !important
}

.button.is-warning.is-outlined {
	background-color: transparent;
	border-color: #ffdd57;
	color: #ffdd57
}

.button.is-warning.is-outlined:focus, .button.is-warning.is-outlined:hover
	{
	background-color: #ffdd57;
	border-color: #ffdd57;
	color: rgba(0, 0, 0, .7)
}

.button.is-warning.is-outlined.is-loading:after {
	border-color: transparent transparent #ffdd57 #ffdd57 !important
}

.button.is-warning.is-outlined[disabled], fieldset[disabled] .button.is-warning.is-outlined
	{
	background-color: transparent;
	border-color: #ffdd57;
	box-shadow: none;
	color: #ffdd57
}

.button.is-warning.is-inverted.is-outlined {
	background-color: transparent;
	border-color: rgba(0, 0, 0, .7);
	color: rgba(0, 0, 0, .7)
}

.button.is-warning.is-inverted.is-outlined:focus, .button.is-warning.is-inverted.is-outlined:hover
	{
	background-color: rgba(0, 0, 0, .7);
	color: #ffdd57
}

.button.is-warning.is-inverted.is-outlined[disabled], fieldset[disabled] .button.is-warning.is-inverted.is-outlined
	{
	background-color: transparent;
	border-color: rgba(0, 0, 0, .7);
	box-shadow: none;
	color: rgba(0, 0, 0, .7)
}

.button.is-danger {
	background-color: #f14668;
	border-color: transparent;
	color: #fff
}

.button.is-danger.is-hovered, .button.is-danger:hover {
	background-color: #f03a5f;
	border-color: transparent;
	color: #fff
}

.button.is-danger.is-focused, .button.is-danger:focus {
	border-color: transparent;
	color: #fff
}

.button.is-danger.is-focused:not (:active ), .button.is-danger:focus:not
	(:active ){
	box-shadow: 0 0 0 .125em rgba(241, 70, 104, .25)
}

.button.is-danger.is-active, .button.is-danger:active {
	background-color: #ef2e55;
	border-color: transparent;
	color: #fff
}

.button.is-danger[disabled], fieldset[disabled] .button.is-danger {
	background-color: #f14668;
	border-color: transparent;
	box-shadow: none
}

.button.is-danger.is-inverted {
	background-color: #fff;
	color: #f14668
}

.button.is-danger.is-inverted:hover {
	background-color: #f2f2f2
}

.button.is-danger.is-inverted[disabled], fieldset[disabled] .button.is-danger.is-inverted
	{
	background-color: #fff;
	border-color: transparent;
	box-shadow: none;
	color: #f14668
}

.button.is-danger.is-loading:after {
	border-color: transparent transparent #fff #fff !important
}

.button.is-danger.is-outlined {
	background-color: transparent;
	border-color: #f14668;
	color: #f14668
}

.button.is-danger.is-outlined:focus, .button.is-danger.is-outlined:hover
	{
	background-color: #f14668;
	border-color: #f14668;
	color: #fff
}

.button.is-danger.is-outlined.is-loading:after {
	border-color: transparent transparent #f14668 #f14668 !important
}

.button.is-danger.is-outlined[disabled], fieldset[disabled] .button.is-danger.is-outlined
	{
	background-color: transparent;
	border-color: #f14668;
	box-shadow: none;
	color: #f14668
}

.button.is-danger.is-inverted.is-outlined {
	background-color: transparent;
	border-color: #fff;
	color: #fff
}

.button.is-danger.is-inverted.is-outlined:focus, .button.is-danger.is-inverted.is-outlined:hover
	{
	background-color: #fff;
	color: #f14668
}

.button.is-danger.is-inverted.is-outlined[disabled], fieldset[disabled] .button.is-danger.is-inverted.is-outlined
	{
	background-color: transparent;
	border-color: #fff;
	box-shadow: none;
	color: #fff
}

.button.is-small {
	border-radius: 2px;
	font-size: .75rem
}

.button.is-normal {
	font-size: 1rem
}

.button.is-medium {
	font-size: 1.25rem
}

.button.is-large {
	font-size: 1.5rem
}

.button[disabled], fieldset[disabled] .button {
	background-color: #fff;
	border-color: #dbdbdb;
	box-shadow: none;
	opacity: .5
}

.button.is-fullwidth {
	display: flex;
	width: 100%
}

.button.is-loading {
	color: transparent !important;
	pointer-events: none
}

.button.is-loading:after {
	position: absolute;
	left: calc(50% - .5em);
	top: calc(50% - .5em);
	position: absolute !important
}

.button.is-static {
	background-color: #f5f5f5;
	border-color: #dbdbdb;
	color: #cfcfcf;
	box-shadow: none;
	pointer-events: none
}

.button.is-rounded {
	border-radius: 290486px;
	padding-left: 1em;
	padding-right: 1em
}

.buttons {
	align-items: center;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start
}

.buttons .button {
	margin-bottom: .5rem
}

.buttons .button:not (:last-child ):not (.is-fullwidth ){
	margin-right: .5rem
}

.buttons:last-child {
	margin-bottom: -.5rem
}

.buttons:not (:last-child ){
	margin-bottom: 1rem
}

.buttons.are-small .button:not (.is-normal ):not (.is-medium ):not (.is-large
	){
	border-radius: 2px;
	font-size: .75rem
}

.buttons.are-medium .button:not (.is-small ):not (.is-normal ):not (.is-large
	){
	font-size: 1.25rem
}

.buttons.are-large .button:not (.is-small ):not (.is-normal ):not (.is-medium
	){
	font-size: 1.5rem
}

.buttons.has-addons .button:not (:first-child ){
	border-bottom-left-radius: 0;
	border-top-left-radius: 0
}

.buttons.has-addons .button:not (:last-child ){
	border-bottom-right-radius: 0;
	border-top-right-radius: 0;
	margin-right: -1px
}

.buttons.has-addons .button:last-child {
	margin-right: 0
}

.buttons.has-addons .button.is-hovered, .buttons.has-addons .button:hover
	{
	z-index: 2
}

.buttons.has-addons .button.is-active, .buttons.has-addons .button.is-focused,
	.buttons.has-addons .button.is-selected, .buttons.has-addons .button:active,
	.buttons.has-addons .button:focus {
	z-index: 3
}

.buttons.has-addons .button.is-active:hover, .buttons.has-addons .button.is-focused:hover,
	.buttons.has-addons .button.is-selected:hover, .buttons.has-addons .button:active:hover,
	.buttons.has-addons .button:focus:hover {
	z-index: 4
}

.buttons.has-addons .button.is-expanded {
	flex-grow: 1
}

.buttons.is-centered {
	justify-content: center
}

.buttons.is-right {
	justify-content: flex-end
}

@media screen and (min-width:1200px) {
	.container {
		max-width: 1180px;
		width: 1180px
	}
	.container.is-fluid {
		margin-left: 10px;
		margin-right: 10px;
		max-width: none;
		width: auto
	}
}

.content li+li {
	margin-top: .25em
}

.content blockquote:not (:last-child ), .content dl:not (:last-child ),
	.content ol:not (:last-child ), .content p:not (:last-child ), .content pre:not
	(:last-child ), .content table:not (:last-child ), .content ul:not (:last-child
	){
	margin-bottom: 1em
}

.content h1, .content h2, .content h3, .content h4, .content h5,
	.content h6 {
	color: #363636;
	font-weight: 600;
	line-height: 1.125
}

.content h1 {
	font-size: 2em;
	margin-bottom: .5em
}

.content h1:not (:first-child ){
	margin-top: 1em
}

.content h2 {
	font-size: 1.75em;
	margin-bottom: .5714em
}

.content h2:not (:first-child ){
	margin-top: 1.1428em
}

.content h3 {
	font-size: 1.5em;
	margin-bottom: .6666em
}

.content h3:not (:first-child ){
	margin-top: 1.3333em
}

.content h4 {
	font-size: 1.25em;
	margin-bottom: .8em
}

.content h5 {
	font-size: 1.125em;
	margin-bottom: .8888em
}

.content h6 {
	font-size: 1em;
	margin-bottom: 1em
}

.content blockquote {
	background-color: #fff;
	border-left: 5px solid #dbdbdb;
	padding: 1.25em 1.5em
}

.content ol {
	list-style-position: outside;
	margin-left: 2em;
	margin-top: 1em
}

.content ol:not ([type] ){
	list-style-type: decimal
}

.content ol:not ([type] ).is-lower-alpha {
	list-style-type: lower-alpha
}

.content ol:not ([type] ).is-lower-roman {
	list-style-type: lower-roman
}

.content ol:not ([type] ).is-upper-alpha {
	list-style-type: upper-alpha
}

.content ol:not ([type] ).is-upper-roman {
	list-style-type: upper-roman
}

.content ul {
	list-style: disc outside;
	margin-left: 2em;
	margin-top: 1em
}

.content ul ul {
	list-style-type: circle;
	margin-top: .5em
}

.content ul ul ul {
	list-style-type: square
}

.content dd {
	margin-left: 2em
}

.content figure {
	margin-left: 2em;
	margin-right: 2em;
	text-align: center
}

.content figure:not (:first-child ){
	margin-top: 2em
}

.content figure:not (:last-child ){
	margin-bottom: 2em
}

.content figure img {
	display: inline-block
}

.content figure figcaption {
	font-style: italic
}

.content pre {
	-webkit-overflow-scrolling: touch;
	overflow-x: auto;
	padding: 1.25em 1.5em;
	white-space: pre;
	word-wrap: normal
}

.content sub, .content sup {
	font-size: 75%
}

.content table {
	width: 100%
}

.content table td, .content table th {
	border: solid #dbdbdb;
	border-width: 0 0 1px;
	padding: .5em .75em;
	vertical-align: top
}

.content table th {
	color: #363636;
	text-align: left
}

.content table thead td, .content table thead th {
	border-width: 0 0 2px;
	color: #363636
}

.content table tfoot td, .content table tfoot th {
	border-width: 2px 0 0;
	color: #363636
}

.content table tbody tr:last-child td, .content table tbody tr:last-child th
	{
	border-bottom-width: 0
}

.content.is-small {
	font-size: .75rem
}

.content.is-medium {
	font-size: 1.25rem
}

.content.is-large {
	font-size: 1.5rem
}

.input, .textarea {
	background-color: #fff;
	border-color: #dbdbdb;
	color: #363636;
	box-shadow: inset 0 1px 2px rgba(0, 10, 18, .1);
	max-width: 100%;
	width: 100%
}

.input::-moz-placeholder, .textarea::-moz-placeholder {
	color: rgba(54, 54, 54, .3)
}

.input::-webkit-input-placeholder, .textarea::-webkit-input-placeholder
	{
	color: rgba(54, 54, 54, .3)
}

.input:-moz-placeholder, .textarea:-moz-placeholder {
	color: rgba(54, 54, 54, .3)
}

.input:-ms-input-placeholder, .textarea:-ms-input-placeholder {
	color: rgba(54, 54, 54, .3)
}

.input.is-hovered, .input:hover, .textarea.is-hovered, .textarea:hover {
	border-color: #b5b5b5
}

.input.is-active, .input.is-focused, .input:active, .input:focus,
	.textarea.is-active, .textarea.is-focused, .textarea:active, .textarea:focus
	{
	border-color: #1dc078;
	box-shadow: 0 0 0 .125em rgba(29, 192, 120, .25)
}

.input[disabled], .textarea[disabled], fieldset[disabled] .input,
	fieldset[disabled] .textarea {
	background-color: #fff;
	border-color: #fff;
	box-shadow: none;
	color: #cfcfcf
}

.input[disabled]::-moz-placeholder, .textarea[disabled]::-moz-placeholder,
	fieldset[disabled] .input::-moz-placeholder, fieldset[disabled] .textarea::-moz-placeholder
	{
	color: hsla(0, 0%, 81.2%, .3)
}

.input[disabled]::-webkit-input-placeholder, .textarea[disabled]::-webkit-input-placeholder,
	fieldset[disabled] .input::-webkit-input-placeholder, fieldset[disabled] .textarea::-webkit-input-placeholder
	{
	color: hsla(0, 0%, 81.2%, .3)
}

.input[disabled]:-moz-placeholder, .textarea[disabled]:-moz-placeholder,
	fieldset[disabled] .input:-moz-placeholder, fieldset[disabled] .textarea:-moz-placeholder
	{
	color: hsla(0, 0%, 81.2%, .3)
}

.input[disabled]:-ms-input-placeholder, .textarea[disabled]:-ms-input-placeholder,
	fieldset[disabled] .input:-ms-input-placeholder, fieldset[disabled] .textarea:-ms-input-placeholder
	{
	color: hsla(0, 0%, 81.2%, .3)
}

.input[readonly], .textarea[readonly] {
	box-shadow: none
}

.input.is-white, .textarea.is-white {
	border-color: #fff
}

.input.is-white.is-active, .input.is-white.is-focused, .input.is-white:active,
	.input.is-white:focus, .textarea.is-white.is-active, .textarea.is-white.is-focused,
	.textarea.is-white:active, .textarea.is-white:focus {
	box-shadow: 0 0 0 .125em hsla(0, 0%, 100%, .25)
}

.input.is-black, .textarea.is-black {
	border-color: #000a12
}

.input.is-black.is-active, .input.is-black.is-focused, .input.is-black:active,
	.input.is-black:focus, .textarea.is-black.is-active, .textarea.is-black.is-focused,
	.textarea.is-black:active, .textarea.is-black:focus {
	box-shadow: 0 0 0 .125em rgba(0, 10, 18, .25)
}

.input.is-light, .textarea.is-light {
	border-color: #f5f5f5
}

.input.is-light.is-active, .input.is-light.is-focused, .input.is-light:active,
	.input.is-light:focus, .textarea.is-light.is-active, .textarea.is-light.is-focused,
	.textarea.is-light:active, .textarea.is-light:focus {
	box-shadow: 0 0 0 .125em hsla(0, 0%, 96.1%, .25)
}

.input.is-dark, .textarea.is-dark {
	border-color: #363636
}

.input.is-dark.is-active, .input.is-dark.is-focused, .input.is-dark:active,
	.input.is-dark:focus, .textarea.is-dark.is-active, .textarea.is-dark.is-focused,
	.textarea.is-dark:active, .textarea.is-dark:focus {
	box-shadow: 0 0 0 .125em rgba(54, 54, 54, .25)
}

.input.is-primary, .textarea.is-primary {
	border-color: #ff7867
}

.input.is-primary.is-active, .input.is-primary.is-focused, .input.is-primary:active,
	.input.is-primary:focus, .textarea.is-primary.is-active, .textarea.is-primary.is-focused,
	.textarea.is-primary:active, .textarea.is-primary:focus {
	box-shadow: 0 0 0 .125em rgba(255, 120, 103, .25)
}

.input.is-link, .textarea.is-link {
	border-color: #1dc078
}

.input.is-link.is-active, .input.is-link.is-focused, .input.is-link:active,
	.input.is-link:focus, .textarea.is-link.is-active, .textarea.is-link.is-focused,
	.textarea.is-link:active, .textarea.is-link:focus {
	box-shadow: 0 0 0 .125em rgba(29, 192, 120, .25)
}

.input.is-info, .textarea.is-info {
	border-color: #3298dc
}

.input.is-info.is-active, .input.is-info.is-focused, .input.is-info:active,
	.input.is-info:focus, .textarea.is-info.is-active, .textarea.is-info.is-focused,
	.textarea.is-info:active, .textarea.is-info:focus {
	box-shadow: 0 0 0 .125em rgba(50, 152, 220, .25)
}

.input.is-success, .textarea.is-success {
	border-color: #5eceb3
}

.input.is-success.is-active, .input.is-success.is-focused, .input.is-success:active,
	.input.is-success:focus, .textarea.is-success.is-active, .textarea.is-success.is-focused,
	.textarea.is-success:active, .textarea.is-success:focus {
	box-shadow: 0 0 0 .125em rgba(94, 206, 179, .25)
}

.input.is-warning, .textarea.is-warning {
	border-color: #ffdd57
}

.input.is-warning.is-active, .input.is-warning.is-focused, .input.is-warning:active,
	.input.is-warning:focus, .textarea.is-warning.is-active, .textarea.is-warning.is-focused,
	.textarea.is-warning:active, .textarea.is-warning:focus {
	box-shadow: 0 0 0 .125em rgba(255, 221, 87, .25)
}

.input.is-danger, .textarea.is-danger {
	border-color: #f14668
}

.input.is-danger.is-active, .input.is-danger.is-focused, .input.is-danger:active,
	.input.is-danger:focus, .textarea.is-danger.is-active, .textarea.is-danger.is-focused,
	.textarea.is-danger:active, .textarea.is-danger:focus {
	box-shadow: 0 0 0 .125em rgba(241, 70, 104, .25)
}

.input.is-small, .textarea.is-small {
	border-radius: 2px;
	font-size: .75rem
}

.input.is-medium, .textarea.is-medium {
	font-size: 1.25rem
}

.input.is-large, .textarea.is-large {
	font-size: 1.5rem
}

.input.is-fullwidth, .textarea.is-fullwidth {
	display: block;
	width: 100%
}

.input.is-inline, .textarea.is-inline {
	display: inline;
	width: auto
}

.input.is-rounded {
	border-radius: 290486px;
	padding-left: 1em;
	padding-right: 1em
}

.input.is-static {
	background-color: transparent;
	border-color: transparent;
	box-shadow: none;
	padding-left: 0;
	padding-right: 0
}

.textarea {
	display: block;
	max-width: 100%;
	min-width: 100%;
	padding: .625em;
	resize: vertical
}

.textarea:not ([rows] ){
	max-height: 600px;
	min-height: 120px
}

.textarea[rows] {
	height: auto
}

.textarea.has-fixed-size {
	resize: none
}

.checkbox, .radio {
	cursor: pointer;
	display: inline-block;
	line-height: 1.25;
	position: relative
}

.checkbox input, .radio input {
	cursor: pointer
}

.checkbox:hover, .radio:hover {
	color: #363636
}

.checkbox[disabled], .radio[disabled], fieldset[disabled] .checkbox,
	fieldset[disabled] .radio {
	color: #cfcfcf;
	cursor: not-allowed
}

.radio+.radio {
	margin-left: .5em
}

.select {
	display: inline-block;
	max-width: 100%;
	position: relative;
	vertical-align: top
}

.select:not (.is-multiple ){
	height: 2.25em
}

.select:not (.is-multiple ):not (.is-loading ):after {
	border-color: #1dc078;
	right: 1.125em;
	z-index: 4
}

.select.is-rounded select {
	border-radius: 290486px;
	padding-left: 1em
}

.select select {
	background-color: #fff;
	border-color: #dbdbdb;
	color: #363636;
	cursor: pointer;
	display: block;
	font-size: 1em;
	max-width: 100%;
	outline: none
}

.select select::-moz-placeholder {
	color: rgba(54, 54, 54, .3)
}

.select select::-webkit-input-placeholder {
	color: rgba(54, 54, 54, .3)
}

.select select:-moz-placeholder {
	color: rgba(54, 54, 54, .3)
}

.select select:-ms-input-placeholder {
	color: rgba(54, 54, 54, .3)
}

.select select.is-hovered, .select select:hover {
	border-color: #b5b5b5
}

.select select.is-active, .select select.is-focused, .select select:active,
	.select select:focus {
	border-color: #1dc078;
	box-shadow: 0 0 0 .125em rgba(29, 192, 120, .25)
}

.select select[disabled], fieldset[disabled] .select select {
	background-color: #fff;
	border-color: #fff;
	box-shadow: none;
	color: #cfcfcf
}

.select select[disabled]::-moz-placeholder, fieldset[disabled] .select select::-moz-placeholder
	{
	color: hsla(0, 0%, 81.2%, .3)
}

.select select[disabled]::-webkit-input-placeholder, fieldset[disabled] .select select::-webkit-input-placeholder
	{
	color: hsla(0, 0%, 81.2%, .3)
}

.select select[disabled]:-moz-placeholder, fieldset[disabled] .select select:-moz-placeholder
	{
	color: hsla(0, 0%, 81.2%, .3)
}

.select select[disabled]:-ms-input-placeholder, fieldset[disabled] .select select:-ms-input-placeholder
	{
	color: hsla(0, 0%, 81.2%, .3)
}

.select select::-ms-expand {
	display: none
}

.select select[disabled]:hover, fieldset[disabled] .select select:hover
	{
	border-color: #fff
}

.select select:not ([multiple] ){
	padding-right: 2.5em
}

.select select[multiple] {
	height: auto;
	padding: 0
}

.select select[multiple] option {
	padding: .5em 1em
}

.select:not (.is-multiple ):not (.is-loading ):hover:after {
	border-color: #363636
}

.select.is-white:not (:hover ):after {
	border-color: #fff
}

.select.is-white select {
	border-color: #fff
}

.select.is-white select.is-hovered, .select.is-white select:hover {
	border-color: #f2f2f2
}

.select.is-white select.is-active, .select.is-white select.is-focused,
	.select.is-white select:active, .select.is-white select:focus {
	box-shadow: 0 0 0 .125em hsla(0, 0%, 100%, .25)
}

.select.is-black:not (:hover ):after {
	border-color: #000a12
}

.select.is-black select {
	border-color: #000a12
}

.select.is-black select.is-hovered, .select.is-black select:hover {
	border-color: #000
}

.select.is-black select.is-active, .select.is-black select.is-focused,
	.select.is-black select:active, .select.is-black select:focus {
	box-shadow: 0 0 0 .125em rgba(0, 10, 18, .25)
}

.select.is-light:not (:hover ):after {
	border-color: #f5f5f5
}

.select.is-light select {
	border-color: #f5f5f5
}

.select.is-light select.is-hovered, .select.is-light select:hover {
	border-color: #e8e8e8
}

.select.is-light select.is-active, .select.is-light select.is-focused,
	.select.is-light select:active, .select.is-light select:focus {
	box-shadow: 0 0 0 .125em hsla(0, 0%, 96.1%, .25)
}

.select.is-dark:not (:hover ):after {
	border-color: #363636
}

.select.is-dark select {
	border-color: #363636
}

.select.is-dark select.is-hovered, .select.is-dark select:hover {
	border-color: #292929
}

.select.is-dark select.is-active, .select.is-dark select.is-focused,
	.select.is-dark select:active, .select.is-dark select:focus {
	box-shadow: 0 0 0 .125em rgba(54, 54, 54, .25)
}

.select.is-primary:not (:hover ):after {
	border-color: #ff7867
}

.select.is-primary select {
	border-color: #ff7867
}

.select.is-primary select.is-hovered, .select.is-primary select:hover {
	border-color: #ff614e
}

.select.is-primary select.is-active, .select.is-primary select.is-focused,
	.select.is-primary select:active, .select.is-primary select:focus {
	box-shadow: 0 0 0 .125em rgba(255, 120, 103, .25)
}

.select.is-link:not (:hover ):after {
	border-color: #1dc078
}

.select.is-link select {
	border-color: #1dc078
}

.select.is-link select.is-hovered, .select.is-link select:hover {
	border-color: #1aaa6a
}

.select.is-link select.is-active, .select.is-link select.is-focused,
	.select.is-link select:active, .select.is-link select:focus {
	box-shadow: 0 0 0 .125em rgba(29, 192, 120, .25)
}

.select.is-info:not (:hover ):after {
	border-color: #3298dc
}

.select.is-info select {
	border-color: #3298dc
}

.select.is-info select.is-hovered, .select.is-info select:hover {
	border-color: #238cd1
}

.select.is-info select.is-active, .select.is-info select.is-focused,
	.select.is-info select:active, .select.is-info select:focus {
	box-shadow: 0 0 0 .125em rgba(50, 152, 220, .25)
}

.select.is-success:not (:hover ):after {
	border-color: #5eceb3
}

.select.is-success select {
	border-color: #5eceb3
}

.select.is-success select.is-hovered, .select.is-success select:hover {
	border-color: #4ac8aa
}

.select.is-success select.is-active, .select.is-success select.is-focused,
	.select.is-success select:active, .select.is-success select:focus {
	box-shadow: 0 0 0 .125em rgba(94, 206, 179, .25)
}

.select.is-warning:not (:hover ):after {
	border-color: #ffdd57
}

.select.is-warning select {
	border-color: #ffdd57
}

.select.is-warning select.is-hovered, .select.is-warning select:hover {
	border-color: #ffd83d
}

.select.is-warning select.is-active, .select.is-warning select.is-focused,
	.select.is-warning select:active, .select.is-warning select:focus {
	box-shadow: 0 0 0 .125em rgba(255, 221, 87, .25)
}

.select.is-danger:not (:hover ):after {
	border-color: #f14668
}

.select.is-danger select {
	border-color: #f14668
}

.select.is-danger select.is-hovered, .select.is-danger select:hover {
	border-color: #ef2e55
}

.select.is-danger select.is-active, .select.is-danger select.is-focused,
	.select.is-danger select:active, .select.is-danger select:focus {
	box-shadow: 0 0 0 .125em rgba(241, 70, 104, .25)
}

.select.is-small {
	border-radius: 2px;
	font-size: .75rem
}

.select.is-medium {
	font-size: 1.25rem
}

.select.is-large {
	font-size: 1.5rem
}

.select.is-disabled:after {
	border-color: #cfcfcf
}

.select.is-fullwidth, .select.is-fullwidth select {
	width: 100%
}

.select.is-loading:after {
	margin-top: 0;
	position: absolute;
	right: .625em;
	top: .625em;
	transform: none
}

.select.is-loading.is-small:after {
	font-size: .75rem
}

.select.is-loading.is-medium:after {
	font-size: 1.25rem
}

.select.is-loading.is-large:after {
	font-size: 1.5rem
}

.file {
	align-items: stretch;
	display: flex;
	justify-content: flex-start;
	position: relative
}

.file.is-white .file-cta {
	background-color: #fff;
	border-color: transparent;
	color: #000a12
}

.file.is-white.is-hovered .file-cta, .file.is-white:hover .file-cta {
	background-color: #f9f9f9;
	border-color: transparent;
	color: #000a12
}

.file.is-white.is-focused .file-cta, .file.is-white:focus .file-cta {
	border-color: transparent;
	box-shadow: 0 0 .5em hsla(0, 0%, 100%, .25);
	color: #000a12
}

.file.is-white.is-active .file-cta, .file.is-white:active .file-cta {
	background-color: #f2f2f2;
	border-color: transparent;
	color: #000a12
}

.file.is-black .file-cta {
	background-color: #000a12;
	border-color: transparent;
	color: #fff
}

.file.is-black.is-hovered .file-cta, .file.is-black:hover .file-cta {
	background-color: #000305;
	border-color: transparent;
	color: #fff
}

.file.is-black.is-focused .file-cta, .file.is-black:focus .file-cta {
	border-color: transparent;
	box-shadow: 0 0 .5em rgba(0, 10, 18, .25);
	color: #fff
}

.file.is-black.is-active .file-cta, .file.is-black:active .file-cta {
	background-color: #000;
	border-color: transparent;
	color: #fff
}

.file.is-light .file-cta {
	background-color: #f5f5f5;
	border-color: transparent;
	color: #363636
}

.file.is-light.is-hovered .file-cta, .file.is-light:hover .file-cta {
	background-color: #eee;
	border-color: transparent;
	color: #363636
}

.file.is-light.is-focused .file-cta, .file.is-light:focus .file-cta {
	border-color: transparent;
	box-shadow: 0 0 .5em hsla(0, 0%, 96.1%, .25);
	color: #363636
}

.file.is-light.is-active .file-cta, .file.is-light:active .file-cta {
	background-color: #e8e8e8;
	border-color: transparent;
	color: #363636
}

.file.is-dark .file-cta {
	background-color: #363636;
	border-color: transparent;
	color: #f5f5f5
}

.file.is-dark.is-hovered .file-cta, .file.is-dark:hover .file-cta {
	background-color: #2f2f2f;
	border-color: transparent;
	color: #f5f5f5
}

.file.is-dark.is-focused .file-cta, .file.is-dark:focus .file-cta {
	border-color: transparent;
	box-shadow: 0 0 .5em rgba(54, 54, 54, .25);
	color: #f5f5f5
}

.file.is-dark.is-active .file-cta, .file.is-dark:active .file-cta {
	background-color: #292929;
	border-color: transparent;
	color: #f5f5f5
}

.file.is-primary .file-cta {
	background-color: #ff7867;
	border-color: transparent;
	color: #fff
}

.file.is-primary.is-hovered .file-cta, .file.is-primary:hover .file-cta
	{
	background-color: #ff6d5a;
	border-color: transparent;
	color: #fff
}

.file.is-primary.is-focused .file-cta, .file.is-primary:focus .file-cta
	{
	border-color: transparent;
	box-shadow: 0 0 .5em rgba(255, 120, 103, .25);
	color: #fff
}

.file.is-primary.is-active .file-cta, .file.is-primary:active .file-cta
	{
	background-color: #ff614e;
	border-color: transparent;
	color: #fff
}

.file.is-link .file-cta {
	background-color: #1dc078;
	border-color: transparent;
	color: #fff
}

.file.is-link.is-hovered .file-cta, .file.is-link:hover .file-cta {
	background-color: #1bb571;
	border-color: transparent;
	color: #fff
}

.file.is-link.is-focused .file-cta, .file.is-link:focus .file-cta {
	border-color: transparent;
	box-shadow: 0 0 .5em rgba(29, 192, 120, .25);
	color: #fff
}

.file.is-link.is-active .file-cta, .file.is-link:active .file-cta {
	background-color: #1aaa6a;
	border-color: transparent;
	color: #fff
}

.file.is-info .file-cta {
	background-color: #3298dc;
	border-color: transparent;
	color: #fff
}

.file.is-info.is-hovered .file-cta, .file.is-info:hover .file-cta {
	background-color: #2793da;
	border-color: transparent;
	color: #fff
}

.file.is-info.is-focused .file-cta, .file.is-info:focus .file-cta {
	border-color: transparent;
	box-shadow: 0 0 .5em rgba(50, 152, 220, .25);
	color: #fff
}

.file.is-info.is-active .file-cta, .file.is-info:active .file-cta {
	background-color: #238cd1;
	border-color: transparent;
	color: #fff
}

.file.is-success .file-cta {
	background-color: #5eceb3;
	border-color: transparent;
	color: #fff
}

.file.is-success.is-hovered .file-cta, .file.is-success:hover .file-cta
	{
	background-color: #54cbae;
	border-color: transparent;
	color: #fff
}

.file.is-success.is-focused .file-cta, .file.is-success:focus .file-cta
	{
	border-color: transparent;
	box-shadow: 0 0 .5em rgba(94, 206, 179, .25);
	color: #fff
}

.file.is-success.is-active .file-cta, .file.is-success:active .file-cta
	{
	background-color: #4ac8aa;
	border-color: transparent;
	color: #fff
}

.file.is-warning .file-cta {
	background-color: #ffdd57;
	border-color: transparent;
	color: rgba(0, 0, 0, .7)
}

.file.is-warning.is-hovered .file-cta, .file.is-warning:hover .file-cta
	{
	background-color: #ffdb4a;
	border-color: transparent;
	color: rgba(0, 0, 0, .7)
}

.file.is-warning.is-focused .file-cta, .file.is-warning:focus .file-cta
	{
	border-color: transparent;
	box-shadow: 0 0 .5em rgba(255, 221, 87, .25);
	color: rgba(0, 0, 0, .7)
}

.file.is-warning.is-active .file-cta, .file.is-warning:active .file-cta
	{
	background-color: #ffd83d;
	border-color: transparent;
	color: rgba(0, 0, 0, .7)
}

.file.is-danger .file-cta {
	background-color: #f14668;
	border-color: transparent;
	color: #fff
}

.file.is-danger.is-hovered .file-cta, .file.is-danger:hover .file-cta {
	background-color: #f03a5f;
	border-color: transparent;
	color: #fff
}

.file.is-danger.is-focused .file-cta, .file.is-danger:focus .file-cta {
	border-color: transparent;
	box-shadow: 0 0 .5em rgba(241, 70, 104, .25);
	color: #fff
}

.file.is-danger.is-active .file-cta, .file.is-danger:active .file-cta {
	background-color: #ef2e55;
	border-color: transparent;
	color: #fff
}

.file.is-small {
	font-size: .75rem
}

.file.is-medium {
	font-size: 1.25rem
}

.file.is-medium .file-icon .fa {
	font-size: 21px
}

.file.is-large {
	font-size: 1.5rem
}

.file.is-large .file-icon .fa {
	font-size: 28px
}

.file.has-name .file-cta {
	border-bottom-right-radius: 0;
	border-top-right-radius: 0
}

.file.has-name .file-name {
	border-bottom-left-radius: 0;
	border-top-left-radius: 0
}

.file.has-name.is-empty .file-cta {
	border-radius: 4px
}

.file.has-name.is-empty .file-name {
	display: none
}

.file.is-boxed .file-label {
	flex-direction: column
}

.file.is-boxed .file-cta {
	flex-direction: column;
	height: auto;
	padding: 1em 3em
}

.file.is-boxed .file-name {
	border-width: 0 1px 1px
}

.file.is-boxed .file-icon {
	height: 1.5em;
	width: 1.5em
}

.file.is-boxed .file-icon .fa {
	font-size: 21px
}

.file.is-boxed.is-small .file-icon .fa {
	font-size: 14px
}

.file.is-boxed.is-medium .file-icon .fa {
	font-size: 28px
}

.file.is-boxed.is-large .file-icon .fa {
	font-size: 35px
}

.file.is-boxed.has-name .file-cta {
	border-radius: 4px 4px 0 0
}

.file.is-boxed.has-name .file-name {
	border-radius: 0 0 4px 4px;
	border-width: 0 1px 1px
}

.file.is-centered {
	justify-content: center
}

.file.is-fullwidth .file-label {
	width: 100%
}

.file.is-fullwidth .file-name {
	flex-grow: 1;
	max-width: none
}

.file.is-right {
	justify-content: flex-end
}

.file.is-right .file-cta {
	border-radius: 0 4px 4px 0
}

.file.is-right .file-name {
	border-radius: 4px 0 0 4px;
	border-width: 1px 0 1px 1px;
	order: -1
}

.file-label {
	align-items: stretch;
	display: flex;
	cursor: pointer;
	justify-content: flex-start;
	overflow: hidden;
	position: relative
}

.file-label:hover .file-cta {
	background-color: #eee;
	color: #363636
}

.file-label:hover .file-name {
	border-color: #d5d5d5
}

.file-label:active .file-cta {
	background-color: #e8e8e8;
	color: #363636
}

.file-label:active .file-name {
	border-color: #cfcfcf
}

.file-input {
	height: 100%;
	left: 0;
	opacity: 0;
	outline: none;
	position: absolute;
	top: 0;
	width: 100%
}

.file-cta, .file-name {
	border-color: #dbdbdb;
	border-radius: 4px;
	font-size: 1em;
	padding-left: 1em;
	padding-right: 1em;
	white-space: nowrap
}

.file-cta {
	background-color: #f5f5f5;
	color: #4a4a4a
}

.file-name {
	border: 1px solid #dbdbdb;
	border-left-width: 0;
	display: block;
	max-width: 16em;
	overflow: hidden;
	text-align: left;
	text-overflow: ellipsis
}

.file-icon {
	align-items: center;
	display: flex;
	height: 1em;
	justify-content: center;
	margin-right: .5em;
	width: 1em
}

.file-icon .fa {
	font-size: 14px
}

.label {
	color: #363636;
	display: block;
	font-size: 1rem;
	font-weight: 700
}

.label:not (:last-child ){
	margin-bottom: .5em
}

.label.is-small {
	font-size: .75rem
}

.label.is-medium {
	font-size: 1.25rem
}

.label.is-large {
	font-size: 1.5rem
}

.help {
	display: block;
	font-size: .75rem;
	margin-top: .25rem
}

.help.is-white {
	color: #fff
}

.help.is-black {
	color: #000a12
}

.help.is-light {
	color: #f5f5f5
}

.help.is-dark {
	color: #363636
}

.help.is-primary {
	color: #ff7867
}

.help.is-link {
	color: #1dc078
}

.help.is-info {
	color: #3298dc
}

.help.is-success {
	color: #5eceb3
}

.help.is-warning {
	color: #ffdd57
}

.help.is-danger {
	color: #f14668
}

.field:not (:last-child ){
	margin-bottom: .75rem
}

.field.has-addons {
	display: flex;
	justify-content: flex-start
}

.field.has-addons .control:not (:last-child ){
	margin-right: -1px
}

.field.has-addons .control:not (:first-child ):not (:last-child ) .button,
	.field.has-addons .control:not (:first-child ):not (:last-child ) .input,
	.field.has-addons .control:not (:first-child ):not (:last-child ) .select select
	{
	border-radius: 0
}

.field.has-addons .control:first-child:not (:only-child ) .button,
	.field.has-addons .control:first-child:not (:only-child ) .input,
	.field.has-addons .control:first-child:not (:only-child ) .select select
	{
	border-bottom-right-radius: 0;
	border-top-right-radius: 0
}

.field.has-addons .control:last-child:not (:only-child ) .button, .field.has-addons .control:last-child:not
	(:only-child ) .input, .field.has-addons .control:last-child:not (:only-child
	) .select select {
	border-bottom-left-radius: 0;
	border-top-left-radius: 0
}

.field.has-addons .control .button:not ([disabled] ).is-hovered, .field.has-addons .control .button:not
	([disabled] ):hover, .field.has-addons .control .input:not ([disabled]
	).is-hovered, .field.has-addons .control .input:not ([disabled] ):hover,
	.field.has-addons .control .select select:not ([disabled] ).is-hovered,
	.field.has-addons .control .select select:not ([disabled] ):hover {
	z-index: 2
}

.field.has-addons .control .button:not ([disabled] ).is-active, .field.has-addons .control .button:not
	([disabled] ).is-focused, .field.has-addons .control .button:not ([disabled]
	):active, .field.has-addons .control .button:not ([disabled] ):focus,
	.field.has-addons .control .input:not ([disabled] ).is-active, .field.has-addons .control .input:not
	([disabled] ).is-focused, .field.has-addons .control .input:not ([disabled]
	):active, .field.has-addons .control .input:not ([disabled] ):focus,
	.field.has-addons .control .select select:not ([disabled] ).is-active,
	.field.has-addons .control .select select:not ([disabled] ).is-focused,
	.field.has-addons .control .select select:not ([disabled] ):active,
	.field.has-addons .control .select select:not ([disabled] ):focus {
	z-index: 3
}

.field.has-addons .control .button:not ([disabled] ).is-active:hover,
	.field.has-addons .control .button:not ([disabled] ).is-focused:hover,
	.field.has-addons .control .button:not ([disabled] ):active:hover,
	.field.has-addons .control .button:not ([disabled] ):focus:hover,
	.field.has-addons .control .input:not ([disabled] ).is-active:hover,
	.field.has-addons .control .input:not ([disabled] ).is-focused:hover,
	.field.has-addons .control .input:not ([disabled] ):active:hover,
	.field.has-addons .control .input:not ([disabled] ):focus:hover, .field.has-addons .control .select select:not
	([disabled] ).is-active:hover, .field.has-addons .control .select select:not
	([disabled] ).is-focused:hover, .field.has-addons .control .select select:not
	([disabled] ):active:hover, .field.has-addons .control .select select:not
	([disabled] ):focus:hover {
	z-index: 4
}

.field.has-addons .control.is-expanded {
	flex-grow: 1
}

.field.has-addons.has-addons-centered {
	justify-content: center
}

.field.has-addons.has-addons-right {
	justify-content: flex-end
}

.field.has-addons.has-addons-fullwidth .control {
	flex-grow: 1;
	flex-shrink: 0
}

.field.is-grouped {
	display: flex;
	justify-content: flex-start
}

.field.is-grouped>.control {
	flex-shrink: 0
}

.field.is-grouped>.control:not (:last-child ){
	margin-bottom: 0;
	margin-right: .75rem
}

.field.is-grouped>.control.is-expanded {
	flex-grow: 1;
	flex-shrink: 1
}

.field.is-grouped.is-grouped-centered {
	justify-content: center
}

.field.is-grouped.is-grouped-right {
	justify-content: flex-end
}

.field.is-grouped.is-grouped-multiline {
	flex-wrap: wrap
}

.field.is-grouped.is-grouped-multiline>.control:last-child, .field.is-grouped.is-grouped-multiline>.control:not
	(:last-child ){
	margin-bottom: .75rem
}

.field.is-grouped.is-grouped-multiline:last-child {
	margin-bottom: -.75rem
}

.field.is-grouped.is-grouped-multiline:not (:last-child ){
	margin-bottom: 0
}

@media print , screen and (min-width:769px) {
	.field.is-horizontal {
		display: flex
	}
}

.field-label .label {
	font-size: inherit
}

@media screen and (max-width:768px) {
	.field-label {
		margin-bottom: .5rem
	}
}

@media print , screen and (min-width:769px) {
	.field-label {
		flex-basis: 0;
		flex-grow: 1;
		flex-shrink: 0;
		margin-right: 1.5rem;
		text-align: right
	}
	.field-label.is-small {
		font-size: .75rem;
		padding-top: .375em
	}
	.field-label.is-normal {
		padding-top: .375em
	}
	.field-label.is-medium {
		font-size: 1.25rem;
		padding-top: .375em
	}
	.field-label.is-large {
		font-size: 1.5rem;
		padding-top: .375em
	}
}

.field-body .field .field {
	margin-bottom: 0
}

@media print , screen and (min-width:769px) {
	.field-body {
		display: flex;
		flex-basis: 0;
		flex-grow: 5;
		flex-shrink: 1
	}
	.field-body .field {
		margin-bottom: 0
	}
	.field-body>.field {
		flex-shrink: 1
	}
	.field-body>.field:not (.is-narrow ){
		flex-grow: 1
	}
	.field-body>.field:not (:last-child ){
		margin-right: .75rem
	}
}

.control {
	box-sizing: border-box;
	clear: both;
	font-size: 1rem;
	position: relative;
	text-align: left
}

.control.has-icons-left .input:focus ~.icon, .control.has-icons-left .select:focus
	~.icon, .control.has-icons-right .input:focus ~.icon, .control.has-icons-right .select:focus
	~.icon {
	color: #cfcfcf
}

.control.has-icons-left .input.is-small ~.icon, .control.has-icons-left .select.is-small
	~.icon, .control.has-icons-right .input.is-small ~.icon, .control.has-icons-right .select.is-small
	~.icon {
	font-size: .75rem
}

.control.has-icons-left .input.is-medium ~.icon, .control.has-icons-left .select.is-medium
	~.icon, .control.has-icons-right .input.is-medium ~.icon, .control.has-icons-right .select.is-medium
	~.icon {
	font-size: 1.25rem
}

.control.has-icons-left .input.is-large ~.icon, .control.has-icons-left .select.is-large
	~.icon, .control.has-icons-right .input.is-large ~.icon, .control.has-icons-right .select.is-large
	~.icon {
	font-size: 1.5rem
}

.control.has-icons-left .icon, .control.has-icons-right .icon {
	color: #dbdbdb;
	height: 2.25em;
	pointer-events: none;
	position: absolute;
	top: 0;
	width: 2.25em;
	z-index: 4
}

.control.has-icons-left .input, .control.has-icons-left .select select {
	padding-left: 2.25em
}

.control.has-icons-left .icon.is-left {
	left: 0
}

.control.has-icons-right .input, .control.has-icons-right .select select
	{
	padding-right: 2.25em
}

.control.has-icons-right .icon.is-right {
	right: 0
}

.control.is-loading:after {
	position: absolute !important;
	right: .625em;
	top: .625em;
	z-index: 4
}

.control.is-loading.is-small:after {
	font-size: .75rem
}

.control.is-loading.is-medium:after {
	font-size: 1.25rem
}

.control.is-loading.is-large:after {
	font-size: 1.5rem
}

.icon {
	align-items: center;
	display: inline-flex;
	justify-content: center;
	height: 1.5rem;
	width: 1.5rem
}

.icon.is-small {
	height: 1rem;
	width: 1rem
}

.icon.is-medium {
	height: 2rem;
	width: 2rem
}

.icon.is-large {
	height: 3rem;
	width: 3rem
}

.image {
	display: block;
	position: relative
}

.image img {
	display: block;
	height: auto;
	width: 100%
}

.image img.is-rounded {
	border-radius: 290486px
}

.image.is-1by1 .has-ratio, .image.is-1by1 img, .image.is-1by2 .has-ratio,
	.image.is-1by2 img, .image.is-1by3 .has-ratio, .image.is-1by3 img,
	.image.is-2by1 .has-ratio, .image.is-2by1 img, .image.is-2by3 .has-ratio,
	.image.is-2by3 img, .image.is-3by1 .has-ratio, .image.is-3by1 img,
	.image.is-3by2 .has-ratio, .image.is-3by2 img, .image.is-3by4 .has-ratio,
	.image.is-3by4 img, .image.is-3by5 .has-ratio, .image.is-3by5 img,
	.image.is-4by3 .has-ratio, .image.is-4by3 img, .image.is-4by5 .has-ratio,
	.image.is-4by5 img, .image.is-5by3 .has-ratio, .image.is-5by3 img,
	.image.is-5by4 .has-ratio, .image.is-5by4 img, .image.is-9by16 .has-ratio,
	.image.is-9by16 img, .image.is-16by9 .has-ratio, .image.is-16by9 img,
	.image.is-square .has-ratio, .image.is-square img {
	height: 100%;
	width: 100%
}

.image.is-1by1, .image.is-square {
	padding-top: 100%
}

.image.is-5by4 {
	padding-top: 80%
}

.image.is-4by3 {
	padding-top: 75%
}

.image.is-3by2 {
	padding-top: 66.6666%
}

.image.is-5by3 {
	padding-top: 60%
}

.image.is-16by9 {
	padding-top: 56.25%
}

.image.is-2by1 {
	padding-top: 50%
}

.image.is-3by1 {
	padding-top: 33.3333%
}

.image.is-4by5 {
	padding-top: 125%
}

.image.is-3by4 {
	padding-top: 133.3333%
}

.image.is-2by3 {
	padding-top: 150%
}

.image.is-3by5 {
	padding-top: 166.6666%
}

.image.is-9by16 {
	padding-top: 177.7777%
}

.image.is-1by2 {
	padding-top: 200%
}

.image.is-1by3 {
	padding-top: 300%
}

.image.is-16x16 {
	height: 16px;
	width: 16px
}

.image.is-24x24 {
	height: 24px;
	width: 24px
}

.image.is-32x32 {
	height: 32px;
	width: 32px
}

.image.is-48x48 {
	height: 48px;
	width: 48px
}

.image.is-64x64 {
	height: 64px;
	width: 64px
}

.image.is-96x96 {
	height: 96px;
	width: 96px
}

.image.is-128x128 {
	height: 128px;
	width: 128px
}

.notification {
	background-color: #fff;
	border-radius: 4px;
	padding: 1.25rem 2.5rem 1.25rem 1.5rem;
	position: relative
}

.notification a:not (.button ):not (.dropdown-item ){
	color: currentColor;
	text-decoration: underline
}

.notification strong {
	color: currentColor
}

.notification code, .notification pre {
	background: #fff
}

.notification pre code {
	background: transparent
}

.notification>.delete {
	position: absolute;
	right: .5rem;
	top: .5rem
}

.notification .content, .notification .subtitle, .notification .title {
	color: currentColor
}

.notification.is-white {
	background-color: #fff;
	color: #000a12
}

.notification.is-black {
	background-color: #000a12;
	color: #fff
}

.notification.is-light {
	background-color: #f5f5f5;
	color: #363636
}

.notification.is-dark {
	background-color: #363636;
	color: #f5f5f5
}

.notification.is-primary {
	background-color: #ff7867;
	color: #fff
}

.notification.is-link {
	background-color: #1dc078;
	color: #fff
}

.notification.is-info {
	background-color: #3298dc;
	color: #fff
}

.notification.is-success {
	background-color: #5eceb3;
	color: #fff
}

.notification.is-warning {
	background-color: #ffdd57;
	color: rgba(0, 0, 0, .7)
}

.notification.is-danger {
	background-color: #f14668;
	color: #fff
}

.progress {
	-moz-appearance: none;
	-webkit-appearance: none;
	border: none;
	border-radius: 290486px;
	display: block;
	height: 1rem;
	overflow: hidden;
	padding: 0;
	width: 100%
}

.progress::-webkit-progress-bar {
	background-color: #dbdbdb
}

.progress::-webkit-progress-value {
	background-color: #454545
}

.progress::-moz-progress-bar {
	background-color: #454545
}

.progress::-ms-fill {
	background-color: #454545;
	border: none
}

.progress:indeterminate {
	-webkit-animation-duration: 1.5s;
	animation-duration: 1.5s;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-name: moveIndeterminate;
	animation-name: moveIndeterminate;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	background-color: #dbdbdb;
	background-image: linear-gradient(90deg, #454545 30%, #dbdbdb 0);
	background-position: 0 0;
	background-repeat: no-repeat;
	background-size: 150% 150%
}

.progress:indeterminate::-webkit-progress-bar {
	background-color: transparent
}

.progress:indeterminate::-moz-progress-bar {
	background-color: transparent
}

.progress.is-white::-webkit-progress-value {
	background-color: #fff
}

.progress.is-white::-moz-progress-bar {
	background-color: #fff
}

.progress.is-white::-ms-fill {
	background-color: #fff
}

.progress.is-white:indeterminate {
	background-image: linear-gradient(90deg, #fff 30%, #dbdbdb 0)
}

.progress.is-black::-webkit-progress-value {
	background-color: #000a12
}

.progress.is-black::-moz-progress-bar {
	background-color: #000a12
}

.progress.is-black::-ms-fill {
	background-color: #000a12
}

.progress.is-black:indeterminate {
	background-image: linear-gradient(90deg, #000a12 30%, #dbdbdb 0)
}

.progress.is-light::-webkit-progress-value {
	background-color: #f5f5f5
}

.progress.is-light::-moz-progress-bar {
	background-color: #f5f5f5
}

.progress.is-light::-ms-fill {
	background-color: #f5f5f5
}

.progress.is-light:indeterminate {
	background-image: linear-gradient(90deg, #f5f5f5 30%, #dbdbdb 0)
}

.progress.is-dark::-webkit-progress-value {
	background-color: #363636
}

.progress.is-dark::-moz-progress-bar {
	background-color: #363636
}

.progress.is-dark::-ms-fill {
	background-color: #363636
}

.progress.is-dark:indeterminate {
	background-image: linear-gradient(90deg, #363636 30%, #dbdbdb 0)
}

.progress.is-primary::-webkit-progress-value {
	background-color: #ff7867
}

.progress.is-primary::-moz-progress-bar {
	background-color: #ff7867
}

.progress.is-primary::-ms-fill {
	background-color: #ff7867
}

.progress.is-primary:indeterminate {
	background-image: linear-gradient(90deg, #ff7867 30%, #dbdbdb 0)
}

.progress.is-link::-webkit-progress-value {
	background-color: #1dc078
}

.progress.is-link::-moz-progress-bar {
	background-color: #1dc078
}

.progress.is-link::-ms-fill {
	background-color: #1dc078
}

.progress.is-link:indeterminate {
	background-image: linear-gradient(90deg, #1dc078 30%, #dbdbdb 0)
}

.progress.is-info::-webkit-progress-value {
	background-color: #3298dc
}

.progress.is-info::-moz-progress-bar {
	background-color: #3298dc
}

.progress.is-info::-ms-fill {
	background-color: #3298dc
}

.progress.is-info:indeterminate {
	background-image: linear-gradient(90deg, #3298dc 30%, #dbdbdb 0)
}

.progress.is-success::-webkit-progress-value {
	background-color: #5eceb3
}

.progress.is-success::-moz-progress-bar {
	background-color: #5eceb3
}

.progress.is-success::-ms-fill {
	background-color: #5eceb3
}

.progress.is-success:indeterminate {
	background-image: linear-gradient(90deg, #5eceb3 30%, #dbdbdb 0)
}

.progress.is-warning::-webkit-progress-value {
	background-color: #ffdd57
}

.progress.is-warning::-moz-progress-bar {
	background-color: #ffdd57
}

.progress.is-warning::-ms-fill {
	background-color: #ffdd57
}

.progress.is-warning:indeterminate {
	background-image: linear-gradient(90deg, #ffdd57 30%, #dbdbdb 0)
}

.progress.is-danger::-webkit-progress-value {
	background-color: #f14668
}

.progress.is-danger::-moz-progress-bar {
	background-color: #f14668
}

.progress.is-danger::-ms-fill {
	background-color: #f14668
}

.progress.is-danger:indeterminate {
	background-image: linear-gradient(90deg, #f14668 30%, #dbdbdb 0)
}

.progress.is-small {
	height: .75rem
}

.progress.is-medium {
	height: 1.25rem
}

.progress.is-large {
	height: 1.5rem
}

@
-webkit-keyframes moveIndeterminate { 0%{
	background-position: 200% 0
}

to {
	background-position: -200% 0
}

}
@
keyframes moveIndeterminate { 0%{
	background-position: 200% 0
}

to {
	background-position: -200% 0
}

}
.table {
	background-color: #fff;
	color: #363636
}

.table td, .table th {
	border: solid #dbdbdb;
	border-width: 0 0 1px;
	padding: .5em .75em;
	vertical-align: top
}

.table td.is-white, .table th.is-white {
	background-color: #fff;
	border-color: #fff;
	color: #000a12
}

.table td.is-black, .table th.is-black {
	background-color: #000a12;
	border-color: #000a12;
	color: #fff
}

.table td.is-light, .table th.is-light {
	background-color: #f5f5f5;
	border-color: #f5f5f5;
	color: #363636
}

.table td.is-dark, .table th.is-dark {
	background-color: #363636;
	border-color: #363636;
	color: #f5f5f5
}

.table td.is-primary, .table th.is-primary {
	background-color: #ff7867;
	border-color: #ff7867;
	color: #fff
}

.table td.is-link, .table th.is-link {
	background-color: #1dc078;
	border-color: #1dc078;
	color: #fff
}

.table td.is-info, .table th.is-info {
	background-color: #3298dc;
	border-color: #3298dc;
	color: #fff
}

.table td.is-success, .table th.is-success {
	background-color: #5eceb3;
	border-color: #5eceb3;
	color: #fff
}

.table td.is-warning, .table th.is-warning {
	background-color: #ffdd57;
	border-color: #ffdd57;
	color: rgba(0, 0, 0, .7)
}

.table td.is-danger, .table th.is-danger {
	background-color: #f14668;
	border-color: #f14668;
	color: #fff
}

.table td.is-narrow, .table th.is-narrow {
	white-space: nowrap;
	width: 1%
}

.table td.is-selected, .table th.is-selected {
	background-color: #ff7867;
	color: #fff
}

.table td.is-selected a, .table td.is-selected strong, .table th.is-selected a,
	.table th.is-selected strong {
	color: currentColor
}

.table th {
	color: #363636;
	text-align: left
}

.table tr.is-selected {
	background-color: #ff7867;
	color: #fff
}

.table tr.is-selected a, .table tr.is-selected strong {
	color: currentColor
}

.table tr.is-selected td, .table tr.is-selected th {
	border-color: #fff;
	color: currentColor
}

.table thead {
	background-color: transparent
}

.table thead td, .table thead th {
	border-width: 0 0 2px;
	color: #363636
}

.table tfoot {
	background-color: transparent
}

.table tfoot td, .table tfoot th {
	border-width: 2px 0 0;
	color: #363636
}

.table tbody {
	background-color: transparent
}

.table tbody tr:last-child td, .table tbody tr:last-child th {
	border-bottom-width: 0
}

.table.is-bordered td, .table.is-bordered th {
	border-width: 1px
}

.table.is-bordered tr:last-child td, .table.is-bordered tr:last-child th
	{
	border-bottom-width: 1px
}

.table.is-fullwidth {
	width: 100%
}

.table.is-hoverable tbody tr:not (.is-selected ):hover {
	background-color: #fafafa
}

.table.is-hoverable.is-striped tbody tr:not (.is-selected ):hover {
	background-color: #fafafa
}

.table.is-hoverable.is-striped tbody tr:not (.is-selected ):hover:nth-child(2n)
	{
	background-color: #f5f5f5
}

.table.is-narrow td, .table.is-narrow th {
	padding: .25em .5em
}

.table.is-striped tbody tr:not (.is-selected ):nth-child(2n) {
	background-color: #fafafa
}

.table-container {
	-webkit-overflow-scrolling: touch;
	overflow: auto;
	overflow-y: hidden;
	max-width: 100%
}

.tags {
	align-items: center;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start
}

.tags .tag {
	margin-bottom: .5rem
}

.tags .tag:not (:last-child ){
	margin-right: .5rem
}

.tags:last-child {
	margin-bottom: -.5rem
}

.tags:not (:last-child ){
	margin-bottom: 1rem
}

.tags.are-medium .tag:not (.is-normal ):not (.is-large ){
	font-size: 1rem
}

.tags.are-large .tag:not (.is-normal ):not (.is-medium ){
	font-size: 1.25rem
}

.tags.is-centered {
	justify-content: center
}

.tags.is-centered .tag {
	margin-right: .25rem;
	margin-left: .25rem
}

.tags.is-right {
	justify-content: flex-end
}

.tags.is-right .tag:not (:first-child ){
	margin-left: .5rem
}

.tags.is-right .tag:not (:last-child ){
	margin-right: 0
}

.tags.has-addons .tag {
	margin-right: 0
}

.tags.has-addons .tag:not (:first-child ){
	margin-left: 0;
	border-bottom-left-radius: 0;
	border-top-left-radius: 0
}

.tags.has-addons .tag:not (:last-child ){
	border-bottom-right-radius: 0;
	border-top-right-radius: 0
}

.tag:not(body) {
	align-items: center;
	background-color: #fff;
	border-radius: 4px;
	color: #454545;
	display: inline-flex;
	font-size: .75rem;
	height: 2em;
	justify-content: center;
	line-height: 1.5;
	padding-left: .75em;
	padding-right: .75em;
	white-space: nowrap
}

.tag:not(body) .delete {
	margin-left: .25rem;
	margin-right: -.375rem
}

.tag:not(body).is-white {
	background-color: #fff;
	color: #000a12
}

.tag:not(body).is-black {
	background-color: #000a12;
	color: #fff
}

.tag:not(body).is-light {
	background-color: #f5f5f5;
	color: #363636
}

.tag:not(body).is-dark {
	background-color: #363636;
	color: #f5f5f5
}

.tag:not(body).is-primary {
	background-color: #ff7867;
	color: #fff
}

.tag:not(body).is-link {
	background-color: #1dc078;
	color: #fff
}

.tag:not(body).is-info {
	background-color: #3298dc;
	color: #fff
}

.tag:not(body).is-success {
	background-color: #5eceb3;
	color: #fff
}

.tag:not(body).is-warning {
	background-color: #ffdd57;
	color: rgba(0, 0, 0, .7)
}

.tag:not(body).is-danger {
	background-color: #f14668;
	color: #fff
}

.tag:not(body).is-normal {
	font-size: .75rem
}

.tag:not(body).is-medium {
	font-size: 1rem
}

.tag:not(body).is-large {
	font-size: 1.25rem
}

.tag:not(body) .icon:first-child:not (:last-child ){
	margin-left: -.375em;
	margin-right: .1875em
}

.tag:not(body) .icon:last-child:not (:first-child ){
	margin-left: .1875em;
	margin-right: -.375em
}

.tag:not(body) .icon:first-child:last-child {
	margin-left: -.375em;
	margin-right: -.375em
}

.tag:not(body).is-delete {
	margin-left: 1px;
	padding: 0;
	position: relative;
	width: 2em
}

.tag:not(body).is-delete:after, .tag:not(body).is-delete:before {
	background-color: currentColor;
	content: "";
	display: block;
	left: 50%;
	position: absolute;
	top: 50%;
	transform: translateX(-50%) translateY(-50%) rotate(45deg);
	transform-origin: center center
}

.tag:not(body).is-delete:before {
	height: 1px;
	width: 50%
}

.tag:not(body).is-delete:after {
	height: 50%;
	width: 1px
}

.tag:not(body).is-delete:focus, .tag:not(body).is-delete:hover {
	background-color: #f2f2f2
}

.tag:not(body).is-delete:active {
	background-color: #e6e6e6
}

.tag:not(body).is-rounded {
	border-radius: 290486px
}

a.tag:hover {
	text-decoration: underline
}

.subtitle, .title {
	word-break: break-word
}

.subtitle em, .subtitle span, .title em, .title span {
	font-weight: inherit
}

.subtitle sub, .subtitle sup, .title sub, .title sup {
	font-size: .75em
}

.subtitle .tag, .title .tag {
	vertical-align: middle
}

.title {
	color: #363636;
	font-size: 2rem;
	font-weight: 600;
	line-height: 1.125
}

.title strong {
	color: inherit;
	font-weight: inherit
}

.title+.highlight {
	margin-top: -.75rem
}

.title:not (.is-spaced )+.subtitle {
	margin-top: -1.25rem
}

.title.is-1 {
	font-size: 2.75rem
}

.title.is-2 {
	font-size: 2.25rem
}

.title.is-3 {
	font-size: 2rem
}

.title.is-4 {
	font-size: 1.5rem
}

.title.is-5 {
	font-size: 1.375rem
}

.title.is-6 {
	font-size: 1.25rem
}

.title.is-7 {
	font-size: 1.125rem
}

.subtitle {
	color: #4a4a4a;
	font-size: 1.375rem;
	font-weight: 400;
	line-height: 1.25
}

.subtitle strong {
	color: #363636;
	font-weight: 600
}

.subtitle:not (.is-spaced )+.title {
	margin-top: -1.25rem
}

.subtitle.is-1 {
	font-size: 2.75rem
}

.subtitle.is-2 {
	font-size: 2.25rem
}

.subtitle.is-3 {
	font-size: 2rem
}

.subtitle.is-4 {
	font-size: 1.5rem
}

.subtitle.is-5 {
	font-size: 1.375rem
}

.subtitle.is-6 {
	font-size: 1.25rem
}

.subtitle.is-7 {
	font-size: 1.125rem
}

.heading {
	display: block;
	font-size: 11px;
	letter-spacing: 1px;
	margin-bottom: 5px;
	text-transform: uppercase
}

.highlight {
	font-weight: 400;
	max-width: 100%;
	overflow: hidden;
	padding: 0
}

.highlight pre {
	overflow: auto;
	max-width: 100%
}

.number {
	align-items: center;
	background-color: #fff;
	border-radius: 290486px;
	display: inline-flex;
	font-size: 1.25rem;
	height: 2em;
	justify-content: center;
	margin-right: 1.5rem;
	min-width: 2.5em;
	padding: .25rem .5rem;
	text-align: center;
	vertical-align: top
}

.breadcrumb {
	font-size: 1rem;
	white-space: nowrap
}

.breadcrumb a {
	align-items: center;
	color: #1dc078;
	display: flex;
	justify-content: center;
	padding: 0 .75em
}

.breadcrumb a:hover {
	color: #363636
}

.breadcrumb li {
	align-items: center;
	display: flex
}

.breadcrumb li:first-child a {
	padding-left: 0
}

.breadcrumb li.is-active a {
	color: #363636;
	cursor: default;
	pointer-events: none
}

.breadcrumb li+li:before {
	color: #b5b5b5;
	content: "\0002f"
}

.breadcrumb ol, .breadcrumb ul {
	align-items: flex-start;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start
}

.breadcrumb .icon:first-child {
	margin-right: .5em
}

.breadcrumb .icon:last-child {
	margin-left: .5em
}

.breadcrumb.is-centered ol, .breadcrumb.is-centered ul {
	justify-content: center
}

.breadcrumb.is-right ol, .breadcrumb.is-right ul {
	justify-content: flex-end
}

.breadcrumb.is-small {
	font-size: .75rem
}

.breadcrumb.is-medium {
	font-size: 1.25rem
}

.breadcrumb.is-large {
	font-size: 1.5rem
}

.breadcrumb.has-arrow-separator li+li:before {
	content: "\02192"
}

.breadcrumb.has-bullet-separator li+li:before {
	content: "\02022"
}

.breadcrumb.has-dot-separator li+li:before {
	content: "\000b7"
}

.breadcrumb.has-succeeds-separator li+li:before {
	content: "\0227B"
}

.card {
	background-color: #fff;
	box-shadow: 0 2px 3px rgba(0, 10, 18, .1), 0 0 0 1px rgba(0, 10, 18, .1);
	color: #454545;
	max-width: 100%;
	position: relative
}

.card-header {
	background-color: transparent;
	align-items: stretch;
	box-shadow: 0 1px 2px rgba(0, 10, 18, .1);
	display: flex
}

.card-header-title {
	align-items: center;
	color: #363636;
	display: flex;
	flex-grow: 1;
	font-weight: 700;
	padding: .75rem
}

.card-header-icon, .card-header-title.is-centered {
	justify-content: center
}

.card-header-icon {
	align-items: center;
	cursor: pointer;
	display: flex;
	padding: .75rem
}

.card-image {
	display: block;
	position: relative
}

.card-content {
	padding: 1.5rem
}

.card-content, .card-footer {
	background-color: transparent
}

.card-footer {
	border-top: 1px solid #dbdbdb;
	align-items: stretch;
	display: flex
}

.card-footer-item {
	align-items: center;
	display: flex;
	flex-basis: 0;
	flex-grow: 1;
	flex-shrink: 0;
	justify-content: center;
	padding: .75rem
}

.card-footer-item:not (:last-child ){
	border-right: 1px solid #dbdbdb
}

.card .media:not (:last-child ){
	margin-bottom: .75rem
}

.dropdown {
	display: inline-flex;
	position: relative;
	vertical-align: top
}

.dropdown.is-active .dropdown-menu, .dropdown.is-hoverable:hover .dropdown-menu
	{
	display: block
}

.dropdown.is-right .dropdown-menu {
	left: auto;
	right: 0
}

.dropdown.is-up .dropdown-menu {
	bottom: 100%;
	padding-bottom: 4px;
	padding-top: 0;
	top: auto
}

.dropdown-menu {
	display: none;
	left: 0;
	min-width: 12rem;
	padding-top: 4px;
	position: absolute;
	top: 100%;
	z-index: 20
}

.dropdown-content {
	background-color: #fff;
	border-radius: 4px;
	box-shadow: 0 2px 3px rgba(0, 10, 18, .1), 0 0 0 1px rgba(0, 10, 18, .1);
	padding-bottom: .5rem;
	padding-top: .5rem
}

.dropdown-item {
	color: #4a4a4a;
	display: block;
	font-size: .875rem;
	line-height: 1.5;
	padding: .375rem 1rem;
	position: relative
}

a.dropdown-item, button.dropdown-item {
	padding-right: 3rem;
	text-align: left;
	white-space: nowrap;
	width: 100%
}

a.dropdown-item:hover, button.dropdown-item:hover {
	background-color: #fff;
	color: #000a12
}

a.dropdown-item.is-active, button.dropdown-item.is-active {
	background-color: #1dc078;
	color: #fff
}

.dropdown-divider {
	background-color: #dbdbdb;
	border: none;
	display: block;
	height: 1px;
	margin: .5rem 0
}

.level {
	align-items: center;
	justify-content: space-between
}

.level code {
	border-radius: 4px
}

.level img {
	display: inline-block;
	vertical-align: top
}

.level.is-mobile, .level.is-mobile .level-left, .level.is-mobile .level-right
	{
	display: flex
}

.level.is-mobile .level-left+.level-right {
	margin-top: 0
}

.level.is-mobile .level-item:not (:last-child ){
	margin-bottom: 0;
	margin-right: .75rem
}

.level.is-mobile .level-item:not (.is-narrow ){
	flex-grow: 1
}

@media print , screen and (min-width:769px) {
	.level {
		display: flex
	}
	.level>.level-item:not (.is-narrow ){
		flex-grow: 1
	}
}

.level-item {
	align-items: center;
	display: flex;
	flex-basis: auto;
	flex-grow: 0;
	flex-shrink: 0;
	justify-content: center
}

.level-item .subtitle, .level-item .title {
	margin-bottom: 0
}

@media screen and (max-width:768px) {
	.level-item:not (:last-child ){
		margin-bottom: .75rem
	}
}

.level-left, .level-right {
	flex-basis: auto;
	flex-grow: 0;
	flex-shrink: 0
}

.level-left .level-item.is-flexible, .level-right .level-item.is-flexible
	{
	flex-grow: 1
}

@media print , screen and (min-width:769px) {
	.level-left .level-item:not (:last-child ), .level-right .level-item:not
		(:last-child ){
		margin-right: .75rem
	}
}

.level-left {
	align-items: center;
	justify-content: flex-start
}

@media screen and (max-width:768px) {
	.level-left+.level-right {
		margin-top: 1.5rem
	}
}

@media print , screen and (min-width:769px) {
	.level-left {
		display: flex
	}
}

.level-right {
	align-items: center;
	justify-content: flex-end
}

@media print , screen and (min-width:769px) {
	.level-right {
		display: flex
	}
}

.list {
	background-color: #fff;
	border-radius: 4px;
	box-shadow: 0 2px 3px rgba(0, 10, 18, .1), 0 0 0 1px rgba(0, 10, 18, .1)
}

.list-item {
	display: block;
	padding: .5em 1em
}

.list-item:not(a) {
	color: #454545
}

.list-item:first-child {
	border-top-left-radius: 4px;
	border-top-right-radius: 4px
}

.list-item:last-child {
	border-top-left-radius: 4px;
	border-top-right-radius: 4px
}

.list-item:not (:last-child ){
	border-bottom: 1px solid #dbdbdb
}

.list-item.is-active {
	background-color: #1dc078;
	color: #fff
}

a.list-item {
	background-color: #fff;
	cursor: pointer
}

.media {
	align-items: flex-start;
	display: flex;
	text-align: left
}

.media .content:not (:last-child ){
	margin-bottom: .75rem
}

.media .media {
	border-top: 1px solid hsla(0, 0%, 85.9%, .5);
	display: flex;
	padding-top: .75rem
}

.media .media .content:not (:last-child ), .media .media .control:not (:last-child
	){
	margin-bottom: .5rem
}

.media .media .media {
	padding-top: .5rem
}

.media .media .media+.media {
	margin-top: .5rem
}

.media+.media {
	border-top: 1px solid hsla(0, 0%, 85.9%, .5);
	margin-top: 1rem;
	padding-top: 1rem
}

.media.is-large+.media {
	margin-top: 1.5rem;
	padding-top: 1.5rem
}

.media-left, .media-right {
	flex-basis: auto;
	flex-grow: 0;
	flex-shrink: 0
}

.media-left {
	margin-right: 1rem
}

.media-right {
	margin-left: 1rem
}

.media-content {
	flex-basis: auto;
	flex-grow: 1;
	flex-shrink: 1;
	text-align: left
}

@media screen and (max-width:768px) {
	.media-content {
		overflow-x: auto
	}
}

.menu {
	font-size: 1rem
}

.menu.is-small {
	font-size: .75rem
}

.menu.is-medium {
	font-size: 1.25rem
}

.menu.is-large {
	font-size: 1.5rem
}

.menu-list {
	line-height: 1.25
}

.menu-list a {
	border-radius: 2px;
	color: #454545;
	display: block;
	padding: .5em .75em
}

.menu-list a:hover {
	background-color: #fff;
	color: #363636
}

.menu-list a.is-active {
	background-color: #1dc078;
	color: #fff
}

.menu-list li ul {
	border-left: 1px solid #dbdbdb;
	margin: .75em;
	padding-left: .75em
}

.menu-label {
	color: #cfcfcf;
	font-size: .75em;
	letter-spacing: .1em;
	text-transform: uppercase
}

.menu-label:not (:first-child ){
	margin-top: 1em
}

.menu-label:not (:last-child ){
	margin-bottom: 1em
}

.message {
	background-color: #fff;
	border-radius: 4px;
	font-size: 1rem
}

.message strong {
	color: currentColor
}

.message a:not (.button ):not (.tag ):not (.dropdown-item ){
	color: currentColor;
	text-decoration: underline
}

.message.is-small {
	font-size: .75rem
}

.message.is-medium {
	font-size: 1.25rem
}

.message.is-large {
	font-size: 1.5rem
}

.message.is-white {
	background-color: #fff
}

.message.is-white .message-header {
	background-color: #fff;
	color: #000a12
}

.message.is-white .message-body {
	border-color: #fff;
	color: #4d4d4d
}

.message.is-black {
	background-color: #f5faff
}

.message.is-black .message-header {
	background-color: #000a12;
	color: #fff
}

.message.is-black .message-body {
	border-color: #000a12;
	color: #000911
}

.message.is-light {
	background-color: #fafafa
}

.message.is-light .message-header {
	background-color: #f5f5f5;
	color: #363636
}

.message.is-light .message-body {
	border-color: #f5f5f5;
	color: #505050
}

.message.is-dark {
	background-color: #fafafa
}

.message.is-dark .message-header {
	background-color: #363636;
	color: #f5f5f5
}

.message.is-dark .message-body {
	border-color: #363636;
	color: #2a2a2a
}

.message.is-primary {
	background-color: #fff6f5
}

.message.is-primary .message-header {
	background-color: #ff7867;
	color: #fff
}

.message.is-primary .message-body {
	border-color: #ff7867;
	color: #c9220d
}

.message.is-link {
	background-color: #f6fefa
}

.message.is-link .message-header {
	background-color: #1dc078;
	color: #fff
}

.message.is-link .message-body {
	border-color: #1dc078;
	color: #0c3222
}

.message.is-info {
	background-color: #f6fbfe
}

.message.is-info .message-header {
	background-color: #3298dc;
	color: #fff
}

.message.is-info .message-body {
	border-color: #3298dc;
	color: #1d5478
}

.message.is-success {
	background-color: #f7fdfb
}

.message.is-success .message-header {
	background-color: #5eceb3;
	color: #fff
}

.message.is-success .message-body {
	border-color: #5eceb3;
	color: #21473e
}

.message.is-warning {
	background-color: #fffdf5
}

.message.is-warning .message-header {
	background-color: #ffdd57;
	color: rgba(0, 0, 0, .7)
}

.message.is-warning .message-body {
	border-color: #ffdd57;
	color: #3b3108
}

.message.is-danger {
	background-color: #fef6f7
}

.message.is-danger .message-header {
	background-color: #f14668;
	color: #fff
}

.message.is-danger .message-body {
	border-color: #f14668;
	color: #bd1839
}

.message-header {
	align-items: center;
	background-color: #454545;
	border-radius: 4px 4px 0 0;
	color: #fff;
	display: flex;
	font-weight: 700;
	justify-content: space-between;
	line-height: 1.25;
	padding: .75em 1em;
	position: relative
}

.message-header .delete {
	flex-grow: 0;
	flex-shrink: 0;
	margin-left: .75em
}

.message-header+.message-body {
	border-width: 0;
	border-top-left-radius: 0;
	border-top-right-radius: 0
}

.message-body {
	border-radius: 4px;
	border: solid #dbdbdb;
	border-width: 0 0 0 4px;
	color: #454545;
	padding: 1.25em 1.5em
}

.message-body code, .message-body pre {
	background-color: #fff
}

.message-body pre code {
	background-color: transparent
}

.modal {
	align-items: center;
	display: none;
	flex-direction: column;
	justify-content: center;
	overflow: hidden;
	z-index: 40
}

.modal.is-active {
	display: flex
}

.modal-background {
	background-color: rgba(0, 10, 18, .86)
}

.modal-card, .modal-content {
	margin: 0 20px;
	max-height: calc(100vh - 160px);
	overflow: auto;
	position: relative;
	width: 100%
}

@media print , screen and (min-width:769px) {
	.modal-card, .modal-content {
		margin: 0 auto;
		max-height: calc(100vh - 40px);
		width: 640px
	}
}

.modal-close {
	background: none;
	height: 40px;
	position: fixed;
	right: 20px;
	top: 20px;
	width: 40px
}

.modal-card {
	display: flex;
	flex-direction: column;
	max-height: calc(100vh - 40px);
	overflow: hidden;
	-ms-overflow-y: visible
}

.modal-card-foot, .modal-card-head {
	align-items: center;
	background-color: #fff;
	display: flex;
	flex-shrink: 0;
	justify-content: flex-start;
	padding: 20px;
	position: relative
}

.modal-card-head {
	border-bottom: 1px solid #dbdbdb;
	border-top-left-radius: 6px;
	border-top-right-radius: 6px
}

.modal-card-title {
	color: #363636;
	flex-grow: 1;
	flex-shrink: 0;
	font-size: 1.5rem;
	line-height: 1
}

.modal-card-foot {
	border-bottom-left-radius: 6px;
	border-bottom-right-radius: 6px;
	border-top: 1px solid #dbdbdb
}

.modal-card-foot .button:not (:last-child ){
	margin-right: 10px
}

.modal-card-body {
	-webkit-overflow-scrolling: touch;
	background-color: #fff;
	flex-grow: 1;
	flex-shrink: 1;
	overflow: auto;
	padding: 20px
}

.navbar {
	background-color: #fff;
	min-height: 3.25rem;
	position: relative;
	z-index: 30
}

.navbar.is-white {
	background-color: #fff;
	color: #000a12
}

.navbar.is-white .navbar-brand .navbar-link, .navbar.is-white .navbar-brand>.navbar-item
	{
	color: #000a12
}

.navbar.is-white .navbar-brand .navbar-link.is-active, .navbar.is-white .navbar-brand .navbar-link:hover,
	.navbar.is-white .navbar-brand>a.navbar-item.is-active, .navbar.is-white .navbar-brand>a.navbar-item:hover
	{
	background-color: #f2f2f2;
	color: #000a12
}

.navbar.is-white .navbar-brand .navbar-link:after {
	border-color: #000a12
}

.navbar.is-white .navbar-burger {
	color: #000a12
}

@media screen and (min-width:769px) {
	.navbar.is-white .navbar-end .navbar-link, .navbar.is-white .navbar-end>.navbar-item,
		.navbar.is-white .navbar-start .navbar-link, .navbar.is-white .navbar-start>.navbar-item
		{
		color: #000a12
	}
	.navbar.is-white .navbar-end .navbar-link.is-active, .navbar.is-white .navbar-end .navbar-link:hover,
		.navbar.is-white .navbar-end>a.navbar-item.is-active, .navbar.is-white .navbar-end>a.navbar-item:hover,
		.navbar.is-white .navbar-start .navbar-link.is-active, .navbar.is-white .navbar-start .navbar-link:hover,
		.navbar.is-white .navbar-start>a.navbar-item.is-active, .navbar.is-white .navbar-start>a.navbar-item:hover
		{
		background-color: #f2f2f2;
		color: #000a12
	}
	.navbar.is-white .navbar-end .navbar-link:after, .navbar.is-white .navbar-start .navbar-link:after
		{
		border-color: #000a12
	}
	.navbar.is-white .navbar-item.has-dropdown.is-active .navbar-link,
		.navbar.is-white .navbar-item.has-dropdown:hover .navbar-link {
		background-color: #f2f2f2;
		color: #000a12
	}
	.navbar.is-white .navbar-dropdown a.navbar-item.is-active {
		background-color: #fff;
		color: #000a12
	}
}

.navbar.is-black {
	background-color: #000a12;
	color: #fff
}

.navbar.is-black .navbar-brand .navbar-link, .navbar.is-black .navbar-brand>.navbar-item
	{
	color: #fff
}

.navbar.is-black .navbar-brand .navbar-link.is-active, .navbar.is-black .navbar-brand .navbar-link:hover,
	.navbar.is-black .navbar-brand>a.navbar-item.is-active, .navbar.is-black .navbar-brand>a.navbar-item:hover
	{
	background-color: #000;
	color: #fff
}

.navbar.is-black .navbar-brand .navbar-link:after {
	border-color: #fff
}

.navbar.is-black .navbar-burger {
	color: #fff
}

@media screen and (min-width:769px) {
	.navbar.is-black .navbar-end .navbar-link, .navbar.is-black .navbar-end>.navbar-item,
		.navbar.is-black .navbar-start .navbar-link, .navbar.is-black .navbar-start>.navbar-item
		{
		color: #fff
	}
	.navbar.is-black .navbar-end .navbar-link.is-active, .navbar.is-black .navbar-end .navbar-link:hover,
		.navbar.is-black .navbar-end>a.navbar-item.is-active, .navbar.is-black .navbar-end>a.navbar-item:hover,
		.navbar.is-black .navbar-start .navbar-link.is-active, .navbar.is-black .navbar-start .navbar-link:hover,
		.navbar.is-black .navbar-start>a.navbar-item.is-active, .navbar.is-black .navbar-start>a.navbar-item:hover
		{
		background-color: #000;
		color: #fff
	}
	.navbar.is-black .navbar-end .navbar-link:after, .navbar.is-black .navbar-start .navbar-link:after
		{
		border-color: #fff
	}
	.navbar.is-black .navbar-item.has-dropdown.is-active .navbar-link,
		.navbar.is-black .navbar-item.has-dropdown:hover .navbar-link {
		background-color: #000;
		color: #fff
	}
	.navbar.is-black .navbar-dropdown a.navbar-item.is-active {
		background-color: #000a12;
		color: #fff
	}
}

.navbar.is-light {
	background-color: #f5f5f5;
	color: #363636
}

.navbar.is-light .navbar-brand .navbar-link, .navbar.is-light .navbar-brand>.navbar-item
	{
	color: #363636
}

.navbar.is-light .navbar-brand .navbar-link.is-active, .navbar.is-light .navbar-brand .navbar-link:hover,
	.navbar.is-light .navbar-brand>a.navbar-item.is-active, .navbar.is-light .navbar-brand>a.navbar-item:hover
	{
	background-color: #e8e8e8;
	color: #363636
}

.navbar.is-light .navbar-brand .navbar-link:after {
	border-color: #363636
}

.navbar.is-light .navbar-burger {
	color: #363636
}

@media screen and (min-width:769px) {
	.navbar.is-light .navbar-end .navbar-link, .navbar.is-light .navbar-end>.navbar-item,
		.navbar.is-light .navbar-start .navbar-link, .navbar.is-light .navbar-start>.navbar-item
		{
		color: #363636
	}
	.navbar.is-light .navbar-end .navbar-link.is-active, .navbar.is-light .navbar-end .navbar-link:hover,
		.navbar.is-light .navbar-end>a.navbar-item.is-active, .navbar.is-light .navbar-end>a.navbar-item:hover,
		.navbar.is-light .navbar-start .navbar-link.is-active, .navbar.is-light .navbar-start .navbar-link:hover,
		.navbar.is-light .navbar-start>a.navbar-item.is-active, .navbar.is-light .navbar-start>a.navbar-item:hover
		{
		background-color: #e8e8e8;
		color: #363636
	}
	.navbar.is-light .navbar-end .navbar-link:after, .navbar.is-light .navbar-start .navbar-link:after
		{
		border-color: #363636
	}
	.navbar.is-light .navbar-item.has-dropdown.is-active .navbar-link,
		.navbar.is-light .navbar-item.has-dropdown:hover .navbar-link {
		background-color: #e8e8e8;
		color: #363636
	}
	.navbar.is-light .navbar-dropdown a.navbar-item.is-active {
		background-color: #f5f5f5;
		color: #363636
	}
}

.navbar.is-dark {
	background-color: #363636;
	color: #f5f5f5
}

.navbar.is-dark .navbar-brand .navbar-link, .navbar.is-dark .navbar-brand>.navbar-item
	{
	color: #f5f5f5
}

.navbar.is-dark .navbar-brand .navbar-link.is-active, .navbar.is-dark .navbar-brand .navbar-link:hover,
	.navbar.is-dark .navbar-brand>a.navbar-item.is-active, .navbar.is-dark .navbar-brand>a.navbar-item:hover
	{
	background-color: #292929;
	color: #f5f5f5
}

.navbar.is-dark .navbar-brand .navbar-link:after {
	border-color: #f5f5f5
}

.navbar.is-dark .navbar-burger {
	color: #f5f5f5
}

@media screen and (min-width:769px) {
	.navbar.is-dark .navbar-end .navbar-link, .navbar.is-dark .navbar-end>.navbar-item,
		.navbar.is-dark .navbar-start .navbar-link, .navbar.is-dark .navbar-start>.navbar-item
		{
		color: #f5f5f5
	}
	.navbar.is-dark .navbar-end .navbar-link.is-active, .navbar.is-dark .navbar-end .navbar-link:hover,
		.navbar.is-dark .navbar-end>a.navbar-item.is-active, .navbar.is-dark .navbar-end>a.navbar-item:hover,
		.navbar.is-dark .navbar-start .navbar-link.is-active, .navbar.is-dark .navbar-start .navbar-link:hover,
		.navbar.is-dark .navbar-start>a.navbar-item.is-active, .navbar.is-dark .navbar-start>a.navbar-item:hover
		{
		background-color: #292929;
		color: #f5f5f5
	}
	.navbar.is-dark .navbar-end .navbar-link:after, .navbar.is-dark .navbar-start .navbar-link:after
		{
		border-color: #f5f5f5
	}
	.navbar.is-dark .navbar-item.has-dropdown.is-active .navbar-link,
		.navbar.is-dark .navbar-item.has-dropdown:hover .navbar-link {
		background-color: #292929;
		color: #f5f5f5
	}
	.navbar.is-dark .navbar-dropdown a.navbar-item.is-active {
		background-color: #363636;
		color: #f5f5f5
	}
}

.navbar.is-primary {
	background-color: #ff7867;
	color: #fff
}

.navbar.is-primary .navbar-brand .navbar-link, .navbar.is-primary .navbar-brand>.navbar-item
	{
	color: #fff
}

.navbar.is-primary .navbar-brand .navbar-link.is-active, .navbar.is-primary .navbar-brand .navbar-link:hover,
	.navbar.is-primary .navbar-brand>a.navbar-item.is-active, .navbar.is-primary .navbar-brand>a.navbar-item:hover
	{
	background-color: #ff614e;
	color: #fff
}

.navbar.is-primary .navbar-brand .navbar-link:after {
	border-color: #fff
}

.navbar.is-primary .navbar-burger {
	color: #fff
}

@media screen and (min-width:769px) {
	.navbar.is-primary .navbar-end .navbar-link, .navbar.is-primary .navbar-end>.navbar-item,
		.navbar.is-primary .navbar-start .navbar-link, .navbar.is-primary .navbar-start>.navbar-item
		{
		color: #fff
	}
	.navbar.is-primary .navbar-end .navbar-link.is-active, .navbar.is-primary .navbar-end .navbar-link:hover,
		.navbar.is-primary .navbar-end>a.navbar-item.is-active, .navbar.is-primary .navbar-end>a.navbar-item:hover,
		.navbar.is-primary .navbar-start .navbar-link.is-active, .navbar.is-primary .navbar-start .navbar-link:hover,
		.navbar.is-primary .navbar-start>a.navbar-item.is-active, .navbar.is-primary .navbar-start>a.navbar-item:hover
		{
		background-color: #ff614e;
		color: #fff
	}
	.navbar.is-primary .navbar-end .navbar-link:after, .navbar.is-primary .navbar-start .navbar-link:after
		{
		border-color: #fff
	}
	.navbar.is-primary .navbar-item.has-dropdown.is-active .navbar-link,
		.navbar.is-primary .navbar-item.has-dropdown:hover .navbar-link {
		background-color: #ff614e;
		color: #fff
	}
	.navbar.is-primary .navbar-dropdown a.navbar-item.is-active {
		background-color: #ff7867;
		color: #fff
	}
}

.navbar.is-link {
	background-color: #1dc078;
	color: #fff
}

.navbar.is-link .navbar-brand .navbar-link, .navbar.is-link .navbar-brand>.navbar-item
	{
	color: #fff
}

.navbar.is-link .navbar-brand .navbar-link.is-active, .navbar.is-link .navbar-brand .navbar-link:hover,
	.navbar.is-link .navbar-brand>a.navbar-item.is-active, .navbar.is-link .navbar-brand>a.navbar-item:hover
	{
	background-color: #1aaa6a;
	color: #fff
}

.navbar.is-link .navbar-brand .navbar-link:after {
	border-color: #fff
}

.navbar.is-link .navbar-burger {
	color: #fff
}

@media screen and (min-width:769px) {
	.navbar.is-link .navbar-end .navbar-link, .navbar.is-link .navbar-end>.navbar-item,
		.navbar.is-link .navbar-start .navbar-link, .navbar.is-link .navbar-start>.navbar-item
		{
		color: #fff
	}
	.navbar.is-link .navbar-end .navbar-link.is-active, .navbar.is-link .navbar-end .navbar-link:hover,
		.navbar.is-link .navbar-end>a.navbar-item.is-active, .navbar.is-link .navbar-end>a.navbar-item:hover,
		.navbar.is-link .navbar-start .navbar-link.is-active, .navbar.is-link .navbar-start .navbar-link:hover,
		.navbar.is-link .navbar-start>a.navbar-item.is-active, .navbar.is-link .navbar-start>a.navbar-item:hover
		{
		background-color: #1aaa6a;
		color: #fff
	}
	.navbar.is-link .navbar-end .navbar-link:after, .navbar.is-link .navbar-start .navbar-link:after
		{
		border-color: #fff
	}
	.navbar.is-link .navbar-item.has-dropdown.is-active .navbar-link,
		.navbar.is-link .navbar-item.has-dropdown:hover .navbar-link {
		background-color: #1aaa6a;
		color: #fff
	}
	.navbar.is-link .navbar-dropdown a.navbar-item.is-active {
		background-color: #1dc078;
		color: #fff
	}
}

.navbar.is-info {
	background-color: #3298dc;
	color: #fff
}

.navbar.is-info .navbar-brand .navbar-link, .navbar.is-info .navbar-brand>.navbar-item
	{
	color: #fff
}

.navbar.is-info .navbar-brand .navbar-link.is-active, .navbar.is-info .navbar-brand .navbar-link:hover,
	.navbar.is-info .navbar-brand>a.navbar-item.is-active, .navbar.is-info .navbar-brand>a.navbar-item:hover
	{
	background-color: #238cd1;
	color: #fff
}

.navbar.is-info .navbar-brand .navbar-link:after {
	border-color: #fff
}

.navbar.is-info .navbar-burger {
	color: #fff
}

@media screen and (min-width:769px) {
	.navbar.is-info .navbar-end .navbar-link, .navbar.is-info .navbar-end>.navbar-item,
		.navbar.is-info .navbar-start .navbar-link, .navbar.is-info .navbar-start>.navbar-item
		{
		color: #fff
	}
	.navbar.is-info .navbar-end .navbar-link.is-active, .navbar.is-info .navbar-end .navbar-link:hover,
		.navbar.is-info .navbar-end>a.navbar-item.is-active, .navbar.is-info .navbar-end>a.navbar-item:hover,
		.navbar.is-info .navbar-start .navbar-link.is-active, .navbar.is-info .navbar-start .navbar-link:hover,
		.navbar.is-info .navbar-start>a.navbar-item.is-active, .navbar.is-info .navbar-start>a.navbar-item:hover
		{
		background-color: #238cd1;
		color: #fff
	}
	.navbar.is-info .navbar-end .navbar-link:after, .navbar.is-info .navbar-start .navbar-link:after
		{
		border-color: #fff
	}
	.navbar.is-info .navbar-item.has-dropdown.is-active .navbar-link,
		.navbar.is-info .navbar-item.has-dropdown:hover .navbar-link {
		background-color: #238cd1;
		color: #fff
	}
	.navbar.is-info .navbar-dropdown a.navbar-item.is-active {
		background-color: #3298dc;
		color: #fff
	}
}

.navbar.is-success {
	background-color: #5eceb3;
	color: #fff
}

.navbar.is-success .navbar-brand .navbar-link, .navbar.is-success .navbar-brand>.navbar-item
	{
	color: #fff
}

.navbar.is-success .navbar-brand .navbar-link.is-active, .navbar.is-success .navbar-brand .navbar-link:hover,
	.navbar.is-success .navbar-brand>a.navbar-item.is-active, .navbar.is-success .navbar-brand>a.navbar-item:hover
	{
	background-color: #4ac8aa;
	color: #fff
}

.navbar.is-success .navbar-brand .navbar-link:after {
	border-color: #fff
}

.navbar.is-success .navbar-burger {
	color: #fff
}

@media screen and (min-width:769px) {
	.navbar.is-success .navbar-end .navbar-link, .navbar.is-success .navbar-end>.navbar-item,
		.navbar.is-success .navbar-start .navbar-link, .navbar.is-success .navbar-start>.navbar-item
		{
		color: #fff
	}
	.navbar.is-success .navbar-end .navbar-link.is-active, .navbar.is-success .navbar-end .navbar-link:hover,
		.navbar.is-success .navbar-end>a.navbar-item.is-active, .navbar.is-success .navbar-end>a.navbar-item:hover,
		.navbar.is-success .navbar-start .navbar-link.is-active, .navbar.is-success .navbar-start .navbar-link:hover,
		.navbar.is-success .navbar-start>a.navbar-item.is-active, .navbar.is-success .navbar-start>a.navbar-item:hover
		{
		background-color: #4ac8aa;
		color: #fff
	}
	.navbar.is-success .navbar-end .navbar-link:after, .navbar.is-success .navbar-start .navbar-link:after
		{
		border-color: #fff
	}
	.navbar.is-success .navbar-item.has-dropdown.is-active .navbar-link,
		.navbar.is-success .navbar-item.has-dropdown:hover .navbar-link {
		background-color: #4ac8aa;
		color: #fff
	}
	.navbar.is-success .navbar-dropdown a.navbar-item.is-active {
		background-color: #5eceb3;
		color: #fff
	}
}

.navbar.is-warning {
	background-color: #ffdd57;
	color: rgba(0, 0, 0, .7)
}

.navbar.is-warning .navbar-brand .navbar-link, .navbar.is-warning .navbar-brand>.navbar-item
	{
	color: rgba(0, 0, 0, .7)
}

.navbar.is-warning .navbar-brand .navbar-link.is-active, .navbar.is-warning .navbar-brand .navbar-link:hover,
	.navbar.is-warning .navbar-brand>a.navbar-item.is-active, .navbar.is-warning .navbar-brand>a.navbar-item:hover
	{
	background-color: #ffd83d;
	color: rgba(0, 0, 0, .7)
}

.navbar.is-warning .navbar-brand .navbar-link:after {
	border-color: rgba(0, 0, 0, .7)
}

.navbar.is-warning .navbar-burger {
	color: rgba(0, 0, 0, .7)
}

@media screen and (min-width:769px) {
	.navbar.is-warning .navbar-end .navbar-link, .navbar.is-warning .navbar-end>.navbar-item,
		.navbar.is-warning .navbar-start .navbar-link, .navbar.is-warning .navbar-start>.navbar-item
		{
		color: rgba(0, 0, 0, .7)
	}
	.navbar.is-warning .navbar-end .navbar-link.is-active, .navbar.is-warning .navbar-end .navbar-link:hover,
		.navbar.is-warning .navbar-end>a.navbar-item.is-active, .navbar.is-warning .navbar-end>a.navbar-item:hover,
		.navbar.is-warning .navbar-start .navbar-link.is-active, .navbar.is-warning .navbar-start .navbar-link:hover,
		.navbar.is-warning .navbar-start>a.navbar-item.is-active, .navbar.is-warning .navbar-start>a.navbar-item:hover
		{
		background-color: #ffd83d;
		color: rgba(0, 0, 0, .7)
	}
	.navbar.is-warning .navbar-end .navbar-link:after, .navbar.is-warning .navbar-start .navbar-link:after
		{
		border-color: rgba(0, 0, 0, .7)
	}
	.navbar.is-warning .navbar-item.has-dropdown.is-active .navbar-link,
		.navbar.is-warning .navbar-item.has-dropdown:hover .navbar-link {
		background-color: #ffd83d;
		color: rgba(0, 0, 0, .7)
	}
	.navbar.is-warning .navbar-dropdown a.navbar-item.is-active {
		background-color: #ffdd57;
		color: rgba(0, 0, 0, .7)
	}
}

.navbar.is-danger {
	background-color: #f14668;
	color: #fff
}

.navbar.is-danger .navbar-brand .navbar-link, .navbar.is-danger .navbar-brand>.navbar-item
	{
	color: #fff
}

.navbar.is-danger .navbar-brand .navbar-link.is-active, .navbar.is-danger .navbar-brand .navbar-link:hover,
	.navbar.is-danger .navbar-brand>a.navbar-item.is-active, .navbar.is-danger .navbar-brand>a.navbar-item:hover
	{
	background-color: #ef2e55;
	color: #fff
}

.navbar.is-danger .navbar-brand .navbar-link:after {
	border-color: #fff
}

.navbar.is-danger .navbar-burger {
	color: #fff
}

@media screen and (min-width:769px) {
	.navbar.is-danger .navbar-end .navbar-link, .navbar.is-danger .navbar-end>.navbar-item,
		.navbar.is-danger .navbar-start .navbar-link, .navbar.is-danger .navbar-start>.navbar-item
		{
		color: #fff
	}
	.navbar.is-danger .navbar-end .navbar-link.is-active, .navbar.is-danger .navbar-end .navbar-link:hover,
		.navbar.is-danger .navbar-end>a.navbar-item.is-active, .navbar.is-danger .navbar-end>a.navbar-item:hover,
		.navbar.is-danger .navbar-start .navbar-link.is-active, .navbar.is-danger .navbar-start .navbar-link:hover,
		.navbar.is-danger .navbar-start>a.navbar-item.is-active, .navbar.is-danger .navbar-start>a.navbar-item:hover
		{
		background-color: #ef2e55;
		color: #fff
	}
	.navbar.is-danger .navbar-end .navbar-link:after, .navbar.is-danger .navbar-start .navbar-link:after
		{
		border-color: #fff
	}
	.navbar.is-danger .navbar-item.has-dropdown.is-active .navbar-link,
		.navbar.is-danger .navbar-item.has-dropdown:hover .navbar-link {
		background-color: #ef2e55;
		color: #fff
	}
	.navbar.is-danger .navbar-dropdown a.navbar-item.is-active {
		background-color: #f14668;
		color: #fff
	}
}

.navbar>.container {
	align-items: stretch;
	display: flex;
	min-height: 3.25rem;
	width: 100%
}

.navbar.has-shadow {
	box-shadow: 0 2px 0 0 #fff
}

.navbar.is-fixed-bottom, .navbar.is-fixed-top {
	left: 0;
	position: fixed;
	right: 0;
	z-index: 30
}

.navbar.is-fixed-bottom {
	bottom: 0
}

.navbar.is-fixed-bottom.has-shadow {
	box-shadow: 0 -2px 0 0 #fff
}

.navbar.is-fixed-top {
	top: 0
}

body.has-navbar-fixed-top, html.has-navbar-fixed-top {
	padding-top: 3.25rem
}

body.has-navbar-fixed-bottom, html.has-navbar-fixed-bottom {
	padding-bottom: 3.25rem
}

.navbar-brand, .navbar-tabs {
	align-items: stretch;
	display: flex;
	flex-shrink: 0;
	min-height: 3.25rem
}

.navbar-brand a.navbar-item:hover {
	background-color: transparent
}

.navbar-tabs {
	-webkit-overflow-scrolling: touch;
	max-width: 100vw;
	overflow-x: auto;
	overflow-y: hidden
}

.navbar-burger {
	color: #4a4a4a;
	cursor: pointer;
	display: block;
	height: 3.25rem;
	position: relative;
	width: 3.25rem;
	margin-left: auto
}

.navbar-burger span {
	background-color: currentColor;
	display: block;
	height: 1px;
	left: calc(50% - 8px);
	position: absolute;
	transform-origin: center;
	transition-duration: 86ms;
	transition-property: background-color, opacity, transform;
	transition-timing-function: ease-out;
	width: 16px
}

.navbar-burger span:first-child {
	top: calc(50% - 6px)
}

.navbar-burger span:nth-child(2) {
	top: calc(50% - 1px)
}

.navbar-burger span:nth-child(3) {
	top: calc(50% + 4px)
}

.navbar-burger:hover {
	background-color: rgba(0, 0, 0, .05)
}

.navbar-burger.is-active span:first-child {
	transform: translateY(5px) rotate(45deg)
}

.navbar-burger.is-active span:nth-child(2) {
	opacity: 0
}

.navbar-burger.is-active span:nth-child(3) {
	transform: translateY(-5px) rotate(-45deg)
}

.navbar-menu {
	display: none
}

.navbar-item, .navbar-link {
	color: #4a4a4a;
	display: block;
	line-height: 1.5;
	padding: .5rem .75rem;
	position: relative
}

.navbar-item .icon:only-child, .navbar-link .icon:only-child {
	margin-left: -.25rem;
	margin-right: -.25rem
}

.navbar-link, a.navbar-item {
	cursor: pointer
}

.navbar-link.is-active, .navbar-link:hover, a.navbar-item.is-active, a.navbar-item:hover
	{
	background-color: #fafafa;
	color: #1dc078
}

.navbar-item {
	display: block;
	flex-grow: 0;
	flex-shrink: 0
}

.navbar-item img {
	max-height: 1.75rem
}

.navbar-item.has-dropdown {
	padding: 0
}

.navbar-item.is-expanded {
	flex-grow: 1;
	flex-shrink: 1
}

.navbar-item.is-tab {
	border-bottom: 1px solid transparent;
	min-height: 3.25rem;
	padding-bottom: calc(.5rem - 1px)
}

.navbar-item.is-tab:hover {
	background-color: transparent;
	border-bottom-color: #1dc078
}

.navbar-item.is-tab.is-active {
	background-color: transparent;
	border-bottom: 3px solid #1dc078;
	color: #1dc078;
	padding-bottom: calc(.5rem - 3px)
}

.navbar-content {
	flex-grow: 1;
	flex-shrink: 1
}

.navbar-link:not (.is-arrowless ){
	padding-right: 2.5em
}

.navbar-link:not (.is-arrowless ):after {
	border-color: #1dc078;
	margin-top: -.375em;
	right: 1.125em
}

.navbar-dropdown {
	font-size: .875rem;
	padding-bottom: .5rem;
	padding-top: .5rem
}

.navbar-dropdown .navbar-item {
	padding-left: 1.5rem;
	padding-right: 1.5rem
}

.navbar-divider {
	background-color: #fff;
	border: none;
	display: none;
	height: 2px;
	margin: .5rem 0
}

@media screen and (max-width:768px) {
	.navbar>.container {
		display: block
	}
	.navbar-brand .navbar-item, .navbar-tabs .navbar-item {
		align-items: center;
		display: flex
	}
	.navbar-link:after {
		display: none
	}
	.navbar-menu {
		background-color: #fff;
		box-shadow: 0 8px 16px rgba(0, 10, 18, .1);
		padding: .5rem 0
	}
	.navbar-menu.is-active {
		display: block
	}
	.navbar.is-fixed-bottom-touch, .navbar.is-fixed-top-touch {
		left: 0;
		position: fixed;
		right: 0;
		z-index: 30
	}
	.navbar.is-fixed-bottom-touch {
		bottom: 0
	}
	.navbar.is-fixed-bottom-touch.has-shadow {
		box-shadow: 0 -2px 3px rgba(0, 10, 18, .1)
	}
	.navbar.is-fixed-top-touch {
		top: 0
	}
	.navbar.is-fixed-top-touch .navbar-menu, .navbar.is-fixed-top .navbar-menu
		{
		-webkit-overflow-scrolling: touch;
		max-height: calc(100vh - 3.25rem);
		overflow: auto
	}
	body.has-navbar-fixed-top-touch, html.has-navbar-fixed-top-touch {
		padding-top: 3.25rem
	}
	body.has-navbar-fixed-bottom-touch, html.has-navbar-fixed-bottom-touch {
		padding-bottom: 3.25rem
	}
}

@media screen and (min-width:769px) {
	.navbar, .navbar-end, .navbar-menu, .navbar-start {
		align-items: stretch;
		display: flex
	}
	.navbar {
		min-height: 3.25rem
	}
	.navbar.is-spaced {
		padding: 1rem 2rem
	}
	.navbar.is-spaced .navbar-end, .navbar.is-spaced .navbar-start {
		align-items: center
	}
	.navbar.is-spaced .navbar-link, .navbar.is-spaced a.navbar-item {
		border-radius: 4px
	}
	.navbar.is-transparent .navbar-link.is-active, .navbar.is-transparent .navbar-link:hover,
		.navbar.is-transparent a.navbar-item.is-active, .navbar.is-transparent a.navbar-item:hover
		{
		background-color: transparent !important
	}
	.navbar.is-transparent .navbar-item.has-dropdown.is-active .navbar-link,
		.navbar.is-transparent .navbar-item.has-dropdown.is-hoverable:hover .navbar-link
		{
		background-color: transparent !important
	}
	.navbar.is-transparent .navbar-dropdown a.navbar-item:hover {
		background-color: #fff;
		color: #000a12
	}
	.navbar.is-transparent .navbar-dropdown a.navbar-item.is-active {
		background-color: #fff;
		color: #1dc078
	}
	.navbar-burger {
		display: none
	}
	.navbar-item, .navbar-link {
		align-items: center;
		display: flex
	}
	.navbar-item {
		display: flex
	}
	.navbar-item.has-dropdown {
		align-items: stretch
	}
	.navbar-item.has-dropdown-up .navbar-link:after {
		transform: rotate(135deg) translate(.25em, -.25em)
	}
	.navbar-item.has-dropdown-up .navbar-dropdown {
		border-bottom: 2px solid #dbdbdb;
		border-radius: 6px 6px 0 0;
		border-top: none;
		bottom: 100%;
		box-shadow: 0 -8px 8px rgba(0, 10, 18, .1);
		top: auto
	}
	.navbar-item.is-active .navbar-dropdown, .navbar-item.is-hoverable:hover .navbar-dropdown
		{
		display: block
	}
	.navbar-item.is-active .navbar-dropdown.is-boxed, .navbar-item.is-hoverable:hover .navbar-dropdown.is-boxed,
		.navbar.is-spaced .navbar-item.is-active .navbar-dropdown, .navbar.is-spaced .navbar-item.is-hoverable:hover .navbar-dropdown
		{
		opacity: 1;
		pointer-events: auto;
		transform: translateY(0)
	}
	.navbar-menu {
		flex-grow: 1;
		flex-shrink: 0
	}
	.navbar-start {
		justify-content: flex-start;
		margin-right: auto
	}
	.navbar-end {
		justify-content: flex-end;
		margin-left: auto
	}
	.navbar-dropdown {
		background-color: #fff;
		border-bottom-left-radius: 6px;
		border-bottom-right-radius: 6px;
		border-top: 2px solid #dbdbdb;
		box-shadow: 0 8px 8px rgba(0, 10, 18, .1);
		display: none;
		font-size: .875rem;
		left: 0;
		min-width: 100%;
		position: absolute;
		top: 100%;
		z-index: 20
	}
	.navbar-dropdown .navbar-item {
		padding: .375rem 1rem;
		white-space: nowrap
	}
	.navbar-dropdown a.navbar-item {
		padding-right: 3rem
	}
	.navbar-dropdown a.navbar-item:hover {
		background-color: #fff;
		color: #000a12
	}
	.navbar-dropdown a.navbar-item.is-active {
		background-color: #fff;
		color: #1dc078
	}
	.navbar-dropdown.is-boxed, .navbar.is-spaced .navbar-dropdown {
		border-radius: 6px;
		border-top: none;
		box-shadow: 0 8px 8px rgba(0, 10, 18, .1), 0 0 0 1px rgba(0, 10, 18, .1);
		display: block;
		opacity: 0;
		pointer-events: none;
		top: calc(100% + -4px);
		transform: translateY(-5px);
		transition-duration: 86ms;
		transition-property: opacity, transform
	}
	.navbar-dropdown.is-right {
		left: auto;
		right: 0
	}
	.navbar-divider {
		display: block
	}
	.container>.navbar .navbar-brand, .navbar>.container .navbar-brand {
		margin-left: -.75rem
	}
	.container>.navbar .navbar-menu, .navbar>.container .navbar-menu {
		margin-right: -.75rem
	}
	.navbar.is-fixed-bottom-desktop, .navbar.is-fixed-top-desktop {
		left: 0;
		position: fixed;
		right: 0;
		z-index: 30
	}
	.navbar.is-fixed-bottom-desktop {
		bottom: 0
	}
	.navbar.is-fixed-bottom-desktop.has-shadow {
		box-shadow: 0 -2px 3px rgba(0, 10, 18, .1)
	}
	.navbar.is-fixed-top-desktop {
		top: 0
	}
	body.has-navbar-fixed-top-desktop, html.has-navbar-fixed-top-desktop {
		padding-top: 3.25rem
	}
	body.has-navbar-fixed-bottom-desktop, html.has-navbar-fixed-bottom-desktop
		{
		padding-bottom: 3.25rem
	}
	body.has-spaced-navbar-fixed-top, html.has-spaced-navbar-fixed-top {
		padding-top: 5.25rem
	}
	body.has-spaced-navbar-fixed-bottom, html.has-spaced-navbar-fixed-bottom
		{
		padding-bottom: 5.25rem
	}
	.navbar-link.is-active, a.navbar-item.is-active {
		color: #000a12
	}
	.navbar-link.is-active:not (:hover ), a.navbar-item.is-active:not (:hover
		){
		background-color: transparent
	}
	.navbar-item.has-dropdown.is-active .navbar-link, .navbar-item.has-dropdown:hover .navbar-link
		{
		background-color: #fafafa
	}
}

.hero.is-fullheight-with-navbar {
	min-height: calc(100vh - 3.25rem)
}

.pagination {
	font-size: 1rem;
	margin: -.25rem
}

.pagination.is-small {
	font-size: .75rem
}

.pagination.is-medium {
	font-size: 1.25rem
}

.pagination.is-large {
	font-size: 1.5rem
}

.pagination.is-rounded .pagination-next, .pagination.is-rounded .pagination-previous
	{
	padding-left: 1em;
	padding-right: 1em;
	border-radius: 290486px
}

.pagination.is-rounded .pagination-link {
	border-radius: 290486px
}

.pagination, .pagination-list {
	align-items: center;
	display: flex;
	justify-content: center;
	text-align: center
}

.pagination-ellipsis, .pagination-link, .pagination-next,
	.pagination-previous {
	font-size: 1em;
	padding-left: .5em;
	padding-right: .5em;
	justify-content: center;
	margin: .25rem;
	text-align: center
}

.pagination-link, .pagination-next, .pagination-previous {
	border-color: #dbdbdb;
	color: #363636;
	min-width: 2.25em
}

.pagination-link:hover, .pagination-next:hover, .pagination-previous:hover
	{
	border-color: #b5b5b5;
	color: #363636
}

.pagination-link:focus, .pagination-next:focus, .pagination-previous:focus
	{
	border-color: #3273dc
}

.pagination-link:active, .pagination-next:active, .pagination-previous:active
	{
	box-shadow: inset 0 1px 2px rgba(0, 10, 18, .2)
}

.pagination-link[disabled], .pagination-next[disabled],
	.pagination-previous[disabled] {
	background-color: #dbdbdb;
	border-color: #dbdbdb;
	box-shadow: none;
	color: #cfcfcf;
	opacity: .5
}

.pagination-next, .pagination-previous {
	padding-left: .75em;
	padding-right: .75em;
	white-space: nowrap
}

.pagination-link.is-current {
	background-color: #1dc078;
	border-color: #1dc078;
	color: #fff
}

.pagination-ellipsis {
	color: #b5b5b5;
	pointer-events: none
}

.pagination-list {
	flex-wrap: wrap
}

@media screen and (max-width:768px) {
	.pagination {
		flex-wrap: wrap
	}
	.pagination-list li, .pagination-next, .pagination-previous {
		flex-grow: 1;
		flex-shrink: 1
	}
}

@media print , screen and (min-width:769px) {
	.pagination-list {
		flex-grow: 1;
		flex-shrink: 1;
		justify-content: flex-start;
		order: 1
	}
	.pagination-previous {
		order: 2
	}
	.pagination-next {
		order: 3
	}
	.pagination {
		justify-content: space-between
	}
	.pagination.is-centered .pagination-previous {
		order: 1
	}
	.pagination.is-centered .pagination-list {
		justify-content: center;
		order: 2
	}
	.pagination.is-centered .pagination-next {
		order: 3
	}
	.pagination.is-right .pagination-previous {
		order: 1
	}
	.pagination.is-right .pagination-next {
		order: 2
	}
	.pagination.is-right .pagination-list {
		justify-content: flex-end;
		order: 3
	}
}

.panel {
	font-size: 1rem
}

.panel:not (:last-child ){
	margin-bottom: 1.5rem
}

.panel-block, .panel-heading, .panel-tabs {
	border-bottom: 1px solid #dbdbdb;
	border-left: 1px solid #dbdbdb;
	border-right: 1px solid #dbdbdb
}

.panel-block:first-child, .panel-heading:first-child, .panel-tabs:first-child
	{
	border-top: 1px solid #dbdbdb
}

.panel-heading {
	background-color: #fff;
	border-radius: 4px 4px 0 0;
	color: #363636;
	font-size: 1.25em;
	font-weight: 300;
	line-height: 1.25;
	padding: .5em .75em
}

.panel-tabs {
	align-items: flex-end;
	display: flex;
	font-size: .875em;
	justify-content: center
}

.panel-tabs a {
	border-bottom: 1px solid #dbdbdb;
	margin-bottom: -1px;
	padding: .5em
}

.panel-tabs a.is-active {
	border-bottom-color: #4a4a4a;
	color: #363636
}

.panel-list a {
	color: #454545
}

.panel-list a:hover {
	color: #1dc078
}

.panel-block {
	align-items: center;
	color: #363636;
	display: flex;
	justify-content: flex-start;
	padding: .5em .75em
}

.panel-block input[type=checkbox] {
	margin-right: .75em
}

.panel-block>.control {
	flex-grow: 1;
	flex-shrink: 1;
	width: 100%
}

.panel-block.is-wrapped {
	flex-wrap: wrap
}

.panel-block.is-active {
	border-left-color: #1dc078;
	color: #363636
}

.panel-block.is-active .panel-icon {
	color: #1dc078
}

a.panel-block, label.panel-block {
	cursor: pointer
}

a.panel-block:hover, label.panel-block:hover {
	background-color: #fff
}

.panel-icon {
	display: inline-block;
	font-size: 14px;
	height: 1em;
	line-height: 1em;
	text-align: center;
	vertical-align: top;
	width: 1em;
	color: #cfcfcf;
	margin-right: .75em
}

.panel-icon .fa {
	font-size: inherit;
	line-height: inherit
}

.tabs {
	-webkit-overflow-scrolling: touch;
	align-items: stretch;
	display: flex;
	font-size: 1rem;
	justify-content: space-between;
	overflow: hidden;
	overflow-x: auto;
	white-space: nowrap
}

.tabs a {
	align-items: center;
	border-bottom: 1px solid #dbdbdb;
	color: #454545;
	display: flex;
	justify-content: center;
	margin-bottom: -1px;
	padding: .5em 1em;
	vertical-align: top
}

.tabs a:hover {
	border-bottom-color: #363636;
	color: #363636
}

.tabs li {
	display: block
}

.tabs li.is-active a {
	border-bottom-color: #1dc078;
	color: #1dc078
}

.tabs ul {
	align-items: center;
	border-bottom: 1px solid #dbdbdb;
	display: flex;
	flex-grow: 1;
	flex-shrink: 0;
	justify-content: flex-start
}

.tabs ul.is-center, .tabs ul.is-left {
	padding-right: .75em
}

.tabs ul.is-center {
	flex: none;
	justify-content: center;
	padding-left: .75em
}

.tabs ul.is-right {
	justify-content: flex-end;
	padding-left: .75em
}

.tabs .icon:first-child {
	margin-right: .5em
}

.tabs .icon:last-child {
	margin-left: .5em
}

.tabs.is-centered ul {
	justify-content: center
}

.tabs.is-right ul {
	justify-content: flex-end
}

.tabs.is-boxed a {
	border: 1px solid transparent;
	border-radius: 4px 4px 0 0
}

.tabs.is-boxed a:hover {
	background-color: #fff;
	border-bottom-color: #dbdbdb
}

.tabs.is-boxed li.is-active a {
	background-color: #fff;
	border-color: #dbdbdb;
	border-bottom-color: transparent !important
}

.tabs.is-fullwidth li {
	flex-grow: 1;
	flex-shrink: 0
}

.tabs.is-toggle a {
	border: 1px solid #dbdbdb;
	margin-bottom: 0;
	position: relative
}

.tabs.is-toggle a:hover {
	background-color: #fff;
	border-color: #b5b5b5;
	z-index: 2
}

.tabs.is-toggle li+li {
	margin-left: -1px
}

.tabs.is-toggle li:first-child a {
	border-radius: 4px 0 0 4px
}

.tabs.is-toggle li:last-child a {
	border-radius: 0 4px 4px 0
}

.tabs.is-toggle li.is-active a {
	background-color: #1dc078;
	border-color: #1dc078;
	color: #fff;
	z-index: 1
}

.tabs.is-toggle ul {
	border-bottom: none
}

.tabs.is-toggle.is-toggle-rounded li:first-child a {
	border-bottom-left-radius: 290486px;
	border-top-left-radius: 290486px;
	padding-left: 1.25em
}

.tabs.is-toggle.is-toggle-rounded li:last-child a {
	border-bottom-right-radius: 290486px;
	border-top-right-radius: 290486px;
	padding-right: 1.25em
}

.tabs.is-small {
	font-size: .75rem
}

.tabs.is-medium {
	font-size: 1.25rem
}

.tabs.is-large {
	font-size: 1.5rem
}

.column {
	display: block;
	flex-basis: 0;
	flex-grow: 1;
	flex-shrink: 1;
	padding: .75rem
}

.columns.is-mobile>.column.is-narrow {
	flex: none
}

.columns.is-mobile>.column.is-full {
	flex: none;
	width: 100%
}

.columns.is-mobile>.column.is-three-quarters {
	flex: none;
	width: 75%
}

.columns.is-mobile>.column.is-two-thirds {
	flex: none;
	width: 66.6666%
}

.columns.is-mobile>.column.is-half {
	flex: none;
	width: 50%
}

.columns.is-mobile>.column.is-one-third {
	flex: none;
	width: 33.3333%
}

.columns.is-mobile>.column.is-one-quarter {
	flex: none;
	width: 25%
}

.columns.is-mobile>.column.is-one-fifth {
	flex: none;
	width: 20%
}

.columns.is-mobile>.column.is-two-fifths {
	flex: none;
	width: 40%
}

.columns.is-mobile>.column.is-three-fifths {
	flex: none;
	width: 60%
}

.columns.is-mobile>.column.is-four-fifths {
	flex: none;
	width: 80%
}

.columns.is-mobile>.column.is-offset-three-quarters {
	margin-left: 75%
}

.columns.is-mobile>.column.is-offset-two-thirds {
	margin-left: 66.6666%
}

.columns.is-mobile>.column.is-offset-half {
	margin-left: 50%
}

.columns.is-mobile>.column.is-offset-one-third {
	margin-left: 33.3333%
}

.columns.is-mobile>.column.is-offset-one-quarter {
	margin-left: 25%
}

.columns.is-mobile>.column.is-offset-one-fifth {
	margin-left: 20%
}

.columns.is-mobile>.column.is-offset-two-fifths {
	margin-left: 40%
}

.columns.is-mobile>.column.is-offset-three-fifths {
	margin-left: 60%
}

.columns.is-mobile>.column.is-offset-four-fifths {
	margin-left: 80%
}

.columns.is-mobile>.column.is-1 {
	flex: none;
	width: 8.33333%
}

.columns.is-mobile>.column.is-offset-1 {
	margin-left: 8.33333%
}

.columns.is-mobile>.column.is-2 {
	flex: none;
	width: 16.66667%
}

.columns.is-mobile>.column.is-offset-2 {
	margin-left: 16.66667%
}

.columns.is-mobile>.column.is-3 {
	flex: none;
	width: 25%
}

.columns.is-mobile>.column.is-offset-3 {
	margin-left: 25%
}

.columns.is-mobile>.column.is-4 {
	flex: none;
	width: 33.33333%
}

.columns.is-mobile>.column.is-offset-4 {
	margin-left: 33.33333%
}

.columns.is-mobile>.column.is-5 {
	flex: none;
	width: 41.66667%
}

.columns.is-mobile>.column.is-offset-5 {
	margin-left: 41.66667%
}

.columns.is-mobile>.column.is-6 {
	flex: none;
	width: 50%
}

.columns.is-mobile>.column.is-offset-6 {
	margin-left: 50%
}

.columns.is-mobile>.column.is-7 {
	flex: none;
	width: 58.33333%
}

.columns.is-mobile>.column.is-offset-7 {
	margin-left: 58.33333%
}

.columns.is-mobile>.column.is-8 {
	flex: none;
	width: 66.66667%
}

.columns.is-mobile>.column.is-offset-8 {
	margin-left: 66.66667%
}

.columns.is-mobile>.column.is-9 {
	flex: none;
	width: 75%
}

.columns.is-mobile>.column.is-offset-9 {
	margin-left: 75%
}

.columns.is-mobile>.column.is-10 {
	flex: none;
	width: 83.33333%
}

.columns.is-mobile>.column.is-offset-10 {
	margin-left: 83.33333%
}

.columns.is-mobile>.column.is-11 {
	flex: none;
	width: 91.66667%
}

.columns.is-mobile>.column.is-offset-11 {
	margin-left: 91.66667%
}

.columns.is-mobile>.column.is-12 {
	flex: none;
	width: 100%
}

.columns.is-mobile>.column.is-offset-12 {
	margin-left: 100%
}

@media screen and (max-width:768px) {
	.column.is-narrow-mobile {
		flex: none
	}
	.column.is-full-mobile {
		flex: none;
		width: 100%
	}
	.column.is-three-quarters-mobile {
		flex: none;
		width: 75%
	}
	.column.is-two-thirds-mobile {
		flex: none;
		width: 66.6666%
	}
	.column.is-half-mobile {
		flex: none;
		width: 50%
	}
	.column.is-one-third-mobile {
		flex: none;
		width: 33.3333%
	}
	.column.is-one-quarter-mobile {
		flex: none;
		width: 25%
	}
	.column.is-one-fifth-mobile {
		flex: none;
		width: 20%
	}
	.column.is-two-fifths-mobile {
		flex: none;
		width: 40%
	}
	.column.is-three-fifths-mobile {
		flex: none;
		width: 60%
	}
	.column.is-four-fifths-mobile {
		flex: none;
		width: 80%
	}
	.column.is-offset-three-quarters-mobile {
		margin-left: 75%
	}
	.column.is-offset-two-thirds-mobile {
		margin-left: 66.6666%
	}
	.column.is-offset-half-mobile {
		margin-left: 50%
	}
	.column.is-offset-one-third-mobile {
		margin-left: 33.3333%
	}
	.column.is-offset-one-quarter-mobile {
		margin-left: 25%
	}
	.column.is-offset-one-fifth-mobile {
		margin-left: 20%
	}
	.column.is-offset-two-fifths-mobile {
		margin-left: 40%
	}
	.column.is-offset-three-fifths-mobile {
		margin-left: 60%
	}
	.column.is-offset-four-fifths-mobile {
		margin-left: 80%
	}
	.column.is-1-mobile {
		flex: none;
		width: 8.33333%
	}
	.column.is-offset-1-mobile {
		margin-left: 8.33333%
	}
	.column.is-2-mobile {
		flex: none;
		width: 16.66667%
	}
	.column.is-offset-2-mobile {
		margin-left: 16.66667%
	}
	.column.is-3-mobile {
		flex: none;
		width: 25%
	}
	.column.is-offset-3-mobile {
		margin-left: 25%
	}
	.column.is-4-mobile {
		flex: none;
		width: 33.33333%
	}
	.column.is-offset-4-mobile {
		margin-left: 33.33333%
	}
	.column.is-5-mobile {
		flex: none;
		width: 41.66667%
	}
	.column.is-offset-5-mobile {
		margin-left: 41.66667%
	}
	.column.is-6-mobile {
		flex: none;
		width: 50%
	}
	.column.is-offset-6-mobile {
		margin-left: 50%
	}
	.column.is-7-mobile {
		flex: none;
		width: 58.33333%
	}
	.column.is-offset-7-mobile {
		margin-left: 58.33333%
	}
	.column.is-8-mobile {
		flex: none;
		width: 66.66667%
	}
	.column.is-offset-8-mobile {
		margin-left: 66.66667%
	}
	.column.is-9-mobile {
		flex: none;
		width: 75%
	}
	.column.is-offset-9-mobile {
		margin-left: 75%
	}
	.column.is-10-mobile {
		flex: none;
		width: 83.33333%
	}
	.column.is-offset-10-mobile {
		margin-left: 83.33333%
	}
	.column.is-11-mobile {
		flex: none;
		width: 91.66667%
	}
	.column.is-offset-11-mobile {
		margin-left: 91.66667%
	}
	.column.is-12-mobile {
		flex: none;
		width: 100%
	}
	.column.is-offset-12-mobile {
		margin-left: 100%
	}
}

@media print , screen and (min-width:769px) {
	.column.is-narrow, .column.is-narrow-tablet {
		flex: none
	}
	.column.is-full, .column.is-full-tablet {
		flex: none;
		width: 100%
	}
	.column.is-three-quarters, .column.is-three-quarters-tablet {
		flex: none;
		width: 75%
	}
	.column.is-two-thirds, .column.is-two-thirds-tablet {
		flex: none;
		width: 66.6666%
	}
	.column.is-half, .column.is-half-tablet {
		flex: none;
		width: 50%
	}
	.column.is-one-third, .column.is-one-third-tablet {
		flex: none;
		width: 33.3333%
	}
	.column.is-one-quarter, .column.is-one-quarter-tablet {
		flex: none;
		width: 25%
	}
	.column.is-one-fifth, .column.is-one-fifth-tablet {
		flex: none;
		width: 20%
	}
	.column.is-two-fifths, .column.is-two-fifths-tablet {
		flex: none;
		width: 40%
	}
	.column.is-three-fifths, .column.is-three-fifths-tablet {
		flex: none;
		width: 60%
	}
	.column.is-four-fifths, .column.is-four-fifths-tablet {
		flex: none;
		width: 80%
	}
	.column.is-offset-three-quarters, .column.is-offset-three-quarters-tablet
		{
		margin-left: 75%
	}
	.column.is-offset-two-thirds, .column.is-offset-two-thirds-tablet {
		margin-left: 66.6666%
	}
	.column.is-offset-half, .column.is-offset-half-tablet {
		margin-left: 50%
	}
	.column.is-offset-one-third, .column.is-offset-one-third-tablet {
		margin-left: 33.3333%
	}
	.column.is-offset-one-quarter, .column.is-offset-one-quarter-tablet {
		margin-left: 25%
	}
	.column.is-offset-one-fifth, .column.is-offset-one-fifth-tablet {
		margin-left: 20%
	}
	.column.is-offset-two-fifths, .column.is-offset-two-fifths-tablet {
		margin-left: 40%
	}
	.column.is-offset-three-fifths, .column.is-offset-three-fifths-tablet {
		margin-left: 60%
	}
	.column.is-offset-four-fifths, .column.is-offset-four-fifths-tablet {
		margin-left: 80%
	}
	.column.is-1, .column.is-1-tablet {
		flex: none;
		width: 8.33333%
	}
	.column.is-offset-1, .column.is-offset-1-tablet {
		margin-left: 8.33333%
	}
	.column.is-2, .column.is-2-tablet {
		flex: none;
		width: 16.66667%
	}
	.column.is-offset-2, .column.is-offset-2-tablet {
		margin-left: 16.66667%
	}
	.column.is-3, .column.is-3-tablet {
		flex: none;
		width: 25%
	}
	.column.is-offset-3, .column.is-offset-3-tablet {
		margin-left: 25%
	}
	.column.is-4, .column.is-4-tablet {
		flex: none;
		width: 33.33333%
	}
	.column.is-offset-4, .column.is-offset-4-tablet {
		margin-left: 33.33333%
	}
	.column.is-5, .column.is-5-tablet {
		flex: none;
		width: 41.66667%
	}
	.column.is-offset-5, .column.is-offset-5-tablet {
		margin-left: 41.66667%
	}
	.column.is-6, .column.is-6-tablet {
		flex: none;
		width: 50%
	}
	.column.is-offset-6, .column.is-offset-6-tablet {
		margin-left: 50%
	}
	.column.is-7, .column.is-7-tablet {
		flex: none;
		width: 58.33333%
	}
	.column.is-offset-7, .column.is-offset-7-tablet {
		margin-left: 58.33333%
	}
	.column.is-8, .column.is-8-tablet {
		flex: none;
		width: 66.66667%
	}
	.column.is-offset-8, .column.is-offset-8-tablet {
		margin-left: 66.66667%
	}
	.column.is-9, .column.is-9-tablet {
		flex: none;
		width: 75%
	}
	.column.is-offset-9, .column.is-offset-9-tablet {
		margin-left: 75%
	}
	.column.is-10, .column.is-10-tablet {
		flex: none;
		width: 83.33333%
	}
	.column.is-offset-10, .column.is-offset-10-tablet {
		margin-left: 83.33333%
	}
	.column.is-11, .column.is-11-tablet {
		flex: none;
		width: 91.66667%
	}
	.column.is-offset-11, .column.is-offset-11-tablet {
		margin-left: 91.66667%
	}
	.column.is-12, .column.is-12-tablet {
		flex: none;
		width: 100%
	}
	.column.is-offset-12, .column.is-offset-12-tablet {
		margin-left: 100%
	}
}

@media screen and (max-width:1199px) {
	.column.is-narrow-touch {
		flex: none
	}
	.column.is-full-touch {
		flex: none;
		width: 100%
	}
	.column.is-three-quarters-touch {
		flex: none;
		width: 75%
	}
	.column.is-two-thirds-touch {
		flex: none;
		width: 66.6666%
	}
	.column.is-half-touch {
		flex: none;
		width: 50%
	}
	.column.is-one-third-touch {
		flex: none;
		width: 33.3333%
	}
	.column.is-one-quarter-touch {
		flex: none;
		width: 25%
	}
	.column.is-one-fifth-touch {
		flex: none;
		width: 20%
	}
	.column.is-two-fifths-touch {
		flex: none;
		width: 40%
	}
	.column.is-three-fifths-touch {
		flex: none;
		width: 60%
	}
	.column.is-four-fifths-touch {
		flex: none;
		width: 80%
	}
	.column.is-offset-three-quarters-touch {
		margin-left: 75%
	}
	.column.is-offset-two-thirds-touch {
		margin-left: 66.6666%
	}
	.column.is-offset-half-touch {
		margin-left: 50%
	}
	.column.is-offset-one-third-touch {
		margin-left: 33.3333%
	}
	.column.is-offset-one-quarter-touch {
		margin-left: 25%
	}
	.column.is-offset-one-fifth-touch {
		margin-left: 20%
	}
	.column.is-offset-two-fifths-touch {
		margin-left: 40%
	}
	.column.is-offset-three-fifths-touch {
		margin-left: 60%
	}
	.column.is-offset-four-fifths-touch {
		margin-left: 80%
	}
	.column.is-1-touch {
		flex: none;
		width: 8.33333%
	}
	.column.is-offset-1-touch {
		margin-left: 8.33333%
	}
	.column.is-2-touch {
		flex: none;
		width: 16.66667%
	}
	.column.is-offset-2-touch {
		margin-left: 16.66667%
	}
	.column.is-3-touch {
		flex: none;
		width: 25%
	}
	.column.is-offset-3-touch {
		margin-left: 25%
	}
	.column.is-4-touch {
		flex: none;
		width: 33.33333%
	}
	.column.is-offset-4-touch {
		margin-left: 33.33333%
	}
	.column.is-5-touch {
		flex: none;
		width: 41.66667%
	}
	.column.is-offset-5-touch {
		margin-left: 41.66667%
	}
	.column.is-6-touch {
		flex: none;
		width: 50%
	}
	.column.is-offset-6-touch {
		margin-left: 50%
	}
	.column.is-7-touch {
		flex: none;
		width: 58.33333%
	}
	.column.is-offset-7-touch {
		margin-left: 58.33333%
	}
	.column.is-8-touch {
		flex: none;
		width: 66.66667%
	}
	.column.is-offset-8-touch {
		margin-left: 66.66667%
	}
	.column.is-9-touch {
		flex: none;
		width: 75%
	}
	.column.is-offset-9-touch {
		margin-left: 75%
	}
	.column.is-10-touch {
		flex: none;
		width: 83.33333%
	}
	.column.is-offset-10-touch {
		margin-left: 83.33333%
	}
	.column.is-11-touch {
		flex: none;
		width: 91.66667%
	}
	.column.is-offset-11-touch {
		margin-left: 91.66667%
	}
	.column.is-12-touch {
		flex: none;
		width: 100%
	}
	.column.is-offset-12-touch {
		margin-left: 100%
	}
}

@media screen and (min-width:1200px) {
	.column.is-narrow-desktop {
		flex: none
	}
	.column.is-full-desktop {
		flex: none;
		width: 100%
	}
	.column.is-three-quarters-desktop {
		flex: none;
		width: 75%
	}
	.column.is-two-thirds-desktop {
		flex: none;
		width: 66.6666%
	}
	.column.is-half-desktop {
		flex: none;
		width: 50%
	}
	.column.is-one-third-desktop {
		flex: none;
		width: 33.3333%
	}
	.column.is-one-quarter-desktop {
		flex: none;
		width: 25%
	}
	.column.is-one-fifth-desktop {
		flex: none;
		width: 20%
	}
	.column.is-two-fifths-desktop {
		flex: none;
		width: 40%
	}
	.column.is-three-fifths-desktop {
		flex: none;
		width: 60%
	}
	.column.is-four-fifths-desktop {
		flex: none;
		width: 80%
	}
	.column.is-offset-three-quarters-desktop {
		margin-left: 75%
	}
	.column.is-offset-two-thirds-desktop {
		margin-left: 66.6666%
	}
	.column.is-offset-half-desktop {
		margin-left: 50%
	}
	.column.is-offset-one-third-desktop {
		margin-left: 33.3333%
	}
	.column.is-offset-one-quarter-desktop {
		margin-left: 25%
	}
	.column.is-offset-one-fifth-desktop {
		margin-left: 20%
	}
	.column.is-offset-two-fifths-desktop {
		margin-left: 40%
	}
	.column.is-offset-three-fifths-desktop {
		margin-left: 60%
	}
	.column.is-offset-four-fifths-desktop {
		margin-left: 80%
	}
	.column.is-1-desktop {
		flex: none;
		width: 8.33333%
	}
	.column.is-offset-1-desktop {
		margin-left: 8.33333%
	}
	.column.is-2-desktop {
		flex: none;
		width: 16.66667%
	}
	.column.is-offset-2-desktop {
		margin-left: 16.66667%
	}
	.column.is-3-desktop {
		flex: none;
		width: 25%
	}
	.column.is-offset-3-desktop {
		margin-left: 25%
	}
	.column.is-4-desktop {
		flex: none;
		width: 33.33333%
	}
	.column.is-offset-4-desktop {
		margin-left: 33.33333%
	}
	.column.is-5-desktop {
		flex: none;
		width: 41.66667%
	}
	.column.is-offset-5-desktop {
		margin-left: 41.66667%
	}
	.column.is-6-desktop {
		flex: none;
		width: 50%
	}
	.column.is-offset-6-desktop {
		margin-left: 50%
	}
	.column.is-7-desktop {
		flex: none;
		width: 58.33333%
	}
	.column.is-offset-7-desktop {
		margin-left: 58.33333%
	}
	.column.is-8-desktop {
		flex: none;
		width: 66.66667%
	}
	.column.is-offset-8-desktop {
		margin-left: 66.66667%
	}
	.column.is-9-desktop {
		flex: none;
		width: 75%
	}
	.column.is-offset-9-desktop {
		margin-left: 75%
	}
	.column.is-10-desktop {
		flex: none;
		width: 83.33333%
	}
	.column.is-offset-10-desktop {
		margin-left: 83.33333%
	}
	.column.is-11-desktop {
		flex: none;
		width: 91.66667%
	}
	.column.is-offset-11-desktop {
		margin-left: 91.66667%
	}
	.column.is-12-desktop {
		flex: none;
		width: 100%
	}
	.column.is-offset-12-desktop {
		margin-left: 100%
	}
}

.columns {
	margin-left: -.75rem;
	margin-right: -.75rem;
	margin-top: -.75rem
}

.columns:last-child {
	margin-bottom: -.75rem
}

.columns:not (:last-child ){
	margin-bottom: .75rem
}

.columns.is-centered {
	justify-content: center
}

.columns.is-gapless {
	margin-left: 0;
	margin-right: 0;
	margin-top: 0
}

.columns.is-gapless>.column {
	margin: 0;
	padding: 0 !important
}

.columns.is-gapless:not (:last-child ){
	margin-bottom: 1.5rem
}

.columns.is-gapless:last-child {
	margin-bottom: 0
}

.columns.is-mobile {
	display: flex
}

.columns.is-multiline {
	flex-wrap: wrap
}

.columns.is-vcentered {
	align-items: center
}

@media print , screen and (min-width:769px) {
	.columns:not (.is-desktop ){
		display: flex
	}
}

@media screen and (min-width:1200px) {
	.columns.is-desktop {
		display: flex
	}
}

.columns.is-variable { -
	-columnGap: 0.75rem;
	margin-left: calc(-1 * var(- -columnGap));
	margin-right: calc(-1 * var(- -columnGap))
}

.columns.is-variable .column {
	padding-left: var(- -columnGap);
	padding-right: var(- -columnGap)
}

.columns.is-variable.is-0 { -
	-columnGap: 0rem
}

@media screen and (max-width:768px) {
	.columns.is-variable.is-0-mobile { -
		-columnGap: 0rem
	}
}

@media print , screen and (min-width:769px) {
	.columns.is-variable.is-0-tablet { -
		-columnGap: 0rem
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.columns.is-variable.is-0-tablet-only { -
		-columnGap: 0rem
	}
}

@media screen and (max-width:1199px) {
	.columns.is-variable.is-0-touch { -
		-columnGap: 0rem
	}
}

@media screen and (min-width:1200px) {
	.columns.is-variable.is-0-desktop { -
		-columnGap: 0rem
	}
}

.columns.is-variable.is-1 { -
	-columnGap: .25rem
}

@media screen and (max-width:768px) {
	.columns.is-variable.is-1-mobile { -
		-columnGap: .25rem
	}
}

@media print , screen and (min-width:769px) {
	.columns.is-variable.is-1-tablet { -
		-columnGap: .25rem
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.columns.is-variable.is-1-tablet-only { -
		-columnGap: .25rem
	}
}

@media screen and (max-width:1199px) {
	.columns.is-variable.is-1-touch { -
		-columnGap: .25rem
	}
}

@media screen and (min-width:1200px) {
	.columns.is-variable.is-1-desktop { -
		-columnGap: .25rem
	}
}

.columns.is-variable.is-2 { -
	-columnGap: .5rem
}

@media screen and (max-width:768px) {
	.columns.is-variable.is-2-mobile { -
		-columnGap: .5rem
	}
}

@media print , screen and (min-width:769px) {
	.columns.is-variable.is-2-tablet { -
		-columnGap: .5rem
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.columns.is-variable.is-2-tablet-only { -
		-columnGap: .5rem
	}
}

@media screen and (max-width:1199px) {
	.columns.is-variable.is-2-touch { -
		-columnGap: .5rem
	}
}

@media screen and (min-width:1200px) {
	.columns.is-variable.is-2-desktop { -
		-columnGap: .5rem
	}
}

.columns.is-variable.is-3 { -
	-columnGap: .75rem
}

@media screen and (max-width:768px) {
	.columns.is-variable.is-3-mobile { -
		-columnGap: .75rem
	}
}

@media print , screen and (min-width:769px) {
	.columns.is-variable.is-3-tablet { -
		-columnGap: .75rem
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.columns.is-variable.is-3-tablet-only { -
		-columnGap: .75rem
	}
}

@media screen and (max-width:1199px) {
	.columns.is-variable.is-3-touch { -
		-columnGap: .75rem
	}
}

@media screen and (min-width:1200px) {
	.columns.is-variable.is-3-desktop { -
		-columnGap: .75rem
	}
}

.columns.is-variable.is-4 { -
	-columnGap: 1rem
}

@media screen and (max-width:768px) {
	.columns.is-variable.is-4-mobile { -
		-columnGap: 1rem
	}
}

@media print , screen and (min-width:769px) {
	.columns.is-variable.is-4-tablet { -
		-columnGap: 1rem
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.columns.is-variable.is-4-tablet-only { -
		-columnGap: 1rem
	}
}

@media screen and (max-width:1199px) {
	.columns.is-variable.is-4-touch { -
		-columnGap: 1rem
	}
}

@media screen and (min-width:1200px) {
	.columns.is-variable.is-4-desktop { -
		-columnGap: 1rem
	}
}

.columns.is-variable.is-5 { -
	-columnGap: 1.25rem
}

@media screen and (max-width:768px) {
	.columns.is-variable.is-5-mobile { -
		-columnGap: 1.25rem
	}
}

@media print , screen and (min-width:769px) {
	.columns.is-variable.is-5-tablet { -
		-columnGap: 1.25rem
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.columns.is-variable.is-5-tablet-only { -
		-columnGap: 1.25rem
	}
}

@media screen and (max-width:1199px) {
	.columns.is-variable.is-5-touch { -
		-columnGap: 1.25rem
	}
}

@media screen and (min-width:1200px) {
	.columns.is-variable.is-5-desktop { -
		-columnGap: 1.25rem
	}
}

.columns.is-variable.is-6 { -
	-columnGap: 1.5rem
}

@media screen and (max-width:768px) {
	.columns.is-variable.is-6-mobile { -
		-columnGap: 1.5rem
	}
}

@media print , screen and (min-width:769px) {
	.columns.is-variable.is-6-tablet { -
		-columnGap: 1.5rem
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.columns.is-variable.is-6-tablet-only { -
		-columnGap: 1.5rem
	}
}

@media screen and (max-width:1199px) {
	.columns.is-variable.is-6-touch { -
		-columnGap: 1.5rem
	}
}

@media screen and (min-width:1200px) {
	.columns.is-variable.is-6-desktop { -
		-columnGap: 1.5rem
	}
}

.columns.is-variable.is-7 { -
	-columnGap: 1.75rem
}

@media screen and (max-width:768px) {
	.columns.is-variable.is-7-mobile { -
		-columnGap: 1.75rem
	}
}

@media print , screen and (min-width:769px) {
	.columns.is-variable.is-7-tablet { -
		-columnGap: 1.75rem
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.columns.is-variable.is-7-tablet-only { -
		-columnGap: 1.75rem
	}
}

@media screen and (max-width:1199px) {
	.columns.is-variable.is-7-touch { -
		-columnGap: 1.75rem
	}
}

@media screen and (min-width:1200px) {
	.columns.is-variable.is-7-desktop { -
		-columnGap: 1.75rem
	}
}

.columns.is-variable.is-8 { -
	-columnGap: 2rem
}

@media screen and (max-width:768px) {
	.columns.is-variable.is-8-mobile { -
		-columnGap: 2rem
	}
}

@media print , screen and (min-width:769px) {
	.columns.is-variable.is-8-tablet { -
		-columnGap: 2rem
	}
}

@media screen and (min-width:769px) and (max-width:1199px) {
	.columns.is-variable.is-8-tablet-only { -
		-columnGap: 2rem
	}
}

@media screen and (max-width:1199px) {
	.columns.is-variable.is-8-touch { -
		-columnGap: 2rem
	}
}

@media screen and (min-width:1200px) {
	.columns.is-variable.is-8-desktop { -
		-columnGap: 2rem
	}
}

.tile {
	align-items: stretch;
	display: block;
	flex-basis: 0;
	flex-grow: 1;
	flex-shrink: 1;
	min-height: -webkit-min-content;
	min-height: -moz-min-content;
	min-height: min-content
}

.tile.is-ancestor {
	margin-left: -.75rem;
	margin-right: -.75rem;
	margin-top: -.75rem
}

.tile.is-ancestor:last-child {
	margin-bottom: -.75rem
}

.tile.is-ancestor:not (:last-child ){
	margin-bottom: .75rem
}

.tile.is-child {
	margin: 0 !important
}

.tile.is-parent {
	padding: .75rem
}

.tile.is-vertical {
	flex-direction: column
}

.tile.is-vertical>.tile.is-child:not (:last-child ){
	margin-bottom: 1.5rem !important
}

@media print , screen and (min-width:769px) {
	.tile:not (.is-child ){
		display: flex
	}
	.tile.is-1 {
		flex: none;
		width: 8.33333%
	}
	.tile.is-2 {
		flex: none;
		width: 16.66667%
	}
	.tile.is-3 {
		flex: none;
		width: 25%
	}
	.tile.is-4 {
		flex: none;
		width: 33.33333%
	}
	.tile.is-5 {
		flex: none;
		width: 41.66667%
	}
	.tile.is-6 {
		flex: none;
		width: 50%
	}
	.tile.is-7 {
		flex: none;
		width: 58.33333%
	}
	.tile.is-8 {
		flex: none;
		width: 66.66667%
	}
	.tile.is-9 {
		flex: none;
		width: 75%
	}
	.tile.is-10 {
		flex: none;
		width: 83.33333%
	}
	.tile.is-11 {
		flex: none;
		width: 91.66667%
	}
	.tile.is-12 {
		flex: none;
		width: 100%
	}
}

.hero {
	align-items: stretch;
	display: flex;
	flex-direction: column;
	justify-content: space-between
}

.hero .navbar {
	background: none
}

.hero .tabs ul {
	border-bottom: none
}

.hero.is-white {
	background-color: #fff;
	color: #000a12
}

.hero.is-white a:not (.button ):not (.dropdown-item ):not (.tag ), .hero.is-white strong
	{
	color: inherit
}

.hero.is-white .title {
	color: #000a12
}

.hero.is-white .subtitle {
	color: rgba(0, 10, 18, .9)
}

.hero.is-white .subtitle a:not (.button ), .hero.is-white .subtitle strong
	{
	color: #000a12
}

@media screen and (max-width:1199px) {
	.hero.is-white .navbar-menu {
		background-color: #fff
	}
}

.hero.is-white .navbar-item, .hero.is-white .navbar-link {
	color: rgba(0, 10, 18, .7)
}

.hero.is-white .navbar-link.is-active, .hero.is-white .navbar-link:hover,
	.hero.is-white a.navbar-item.is-active, .hero.is-white a.navbar-item:hover
	{
	background-color: #f2f2f2;
	color: #000a12
}

.hero.is-white .tabs a {
	color: #000a12;
	opacity: .9
}

.hero.is-white .tabs a:hover {
	opacity: 1
}

.hero.is-white .tabs li.is-active a {
	opacity: 1
}

.hero.is-white .tabs.is-boxed a, .hero.is-white .tabs.is-toggle a {
	color: #000a12
}

.hero.is-white .tabs.is-boxed a:hover, .hero.is-white .tabs.is-toggle a:hover
	{
	background-color: rgba(0, 10, 18, .1)
}

.hero.is-white .tabs.is-boxed li.is-active a, .hero.is-white .tabs.is-boxed li.is-active a:hover,
	.hero.is-white .tabs.is-toggle li.is-active a, .hero.is-white .tabs.is-toggle li.is-active a:hover
	{
	background-color: #000a12;
	border-color: #000a12;
	color: #fff
}

.hero.is-white.is-bold {
	background-image: linear-gradient(141deg, #e6e6e6, #fff 71%, #fff)
}

@media screen and (max-width:768px) {
	.hero.is-white.is-bold .navbar-menu {
		background-image: linear-gradient(141deg, #e6e6e6, #fff 71%, #fff)
	}
}

.hero.is-black {
	background-color: #000a12;
	color: #fff
}

.hero.is-black a:not (.button ):not (.dropdown-item ):not (.tag ), .hero.is-black strong
	{
	color: inherit
}

.hero.is-black .title {
	color: #fff
}

.hero.is-black .subtitle {
	color: hsla(0, 0%, 100%, .9)
}

.hero.is-black .subtitle a:not (.button ), .hero.is-black .subtitle strong
	{
	color: #fff
}

@media screen and (max-width:1199px) {
	.hero.is-black .navbar-menu {
		background-color: #000a12
	}
}

.hero.is-black .navbar-item, .hero.is-black .navbar-link {
	color: hsla(0, 0%, 100%, .7)
}

.hero.is-black .navbar-link.is-active, .hero.is-black .navbar-link:hover,
	.hero.is-black a.navbar-item.is-active, .hero.is-black a.navbar-item:hover
	{
	background-color: #000;
	color: #fff
}

.hero.is-black .tabs a {
	color: #fff;
	opacity: .9
}

.hero.is-black .tabs a:hover {
	opacity: 1
}

.hero.is-black .tabs li.is-active a {
	opacity: 1
}

.hero.is-black .tabs.is-boxed a, .hero.is-black .tabs.is-toggle a {
	color: #fff
}

.hero.is-black .tabs.is-boxed a:hover, .hero.is-black .tabs.is-toggle a:hover
	{
	background-color: rgba(0, 10, 18, .1)
}

.hero.is-black .tabs.is-boxed li.is-active a, .hero.is-black .tabs.is-boxed li.is-active a:hover,
	.hero.is-black .tabs.is-toggle li.is-active a, .hero.is-black .tabs.is-toggle li.is-active a:hover
	{
	background-color: #fff;
	border-color: #fff;
	color: #000a12
}

.hero.is-black.is-bold {
	background-image: linear-gradient(141deg, #000, #000a12 71%, #00112c)
}

@media screen and (max-width:768px) {
	.hero.is-black.is-bold .navbar-menu {
		background-image: linear-gradient(141deg, #000, #000a12 71%, #00112c)
	}
}

.hero.is-light {
	background-color: #f5f5f5;
	color: #363636
}

.hero.is-light a:not (.button ):not (.dropdown-item ):not (.tag ), .hero.is-light strong
	{
	color: inherit
}

.hero.is-light .title {
	color: #363636
}

.hero.is-light .subtitle {
	color: rgba(54, 54, 54, .9)
}

.hero.is-light .subtitle a:not (.button ), .hero.is-light .subtitle strong
	{
	color: #363636
}

@media screen and (max-width:1199px) {
	.hero.is-light .navbar-menu {
		background-color: #f5f5f5
	}
}

.hero.is-light .navbar-item, .hero.is-light .navbar-link {
	color: rgba(54, 54, 54, .7)
}

.hero.is-light .navbar-link.is-active, .hero.is-light .navbar-link:hover,
	.hero.is-light a.navbar-item.is-active, .hero.is-light a.navbar-item:hover
	{
	background-color: #e8e8e8;
	color: #363636
}

.hero.is-light .tabs a {
	color: #363636;
	opacity: .9
}

.hero.is-light .tabs a:hover {
	opacity: 1
}

.hero.is-light .tabs li.is-active a {
	opacity: 1
}

.hero.is-light .tabs.is-boxed a, .hero.is-light .tabs.is-toggle a {
	color: #363636
}

.hero.is-light .tabs.is-boxed a:hover, .hero.is-light .tabs.is-toggle a:hover
	{
	background-color: rgba(0, 10, 18, .1)
}

.hero.is-light .tabs.is-boxed li.is-active a, .hero.is-light .tabs.is-boxed li.is-active a:hover,
	.hero.is-light .tabs.is-toggle li.is-active a, .hero.is-light .tabs.is-toggle li.is-active a:hover
	{
	background-color: #363636;
	border-color: #363636;
	color: #f5f5f5
}

.hero.is-light.is-bold {
	background-image: linear-gradient(141deg, #dfd8d9, #f5f5f5 71%, #fff)
}

@media screen and (max-width:768px) {
	.hero.is-light.is-bold .navbar-menu {
		background-image: linear-gradient(141deg, #dfd8d9, #f5f5f5 71%, #fff)
	}
}

.hero.is-dark {
	background-color: #363636;
	color: #f5f5f5
}

.hero.is-dark a:not (.button ):not (.dropdown-item ):not (.tag ), .hero.is-dark strong
	{
	color: inherit
}

.hero.is-dark .title {
	color: #f5f5f5
}

.hero.is-dark .subtitle {
	color: hsla(0, 0%, 96.1%, .9)
}

.hero.is-dark .subtitle a:not (.button ), .hero.is-dark .subtitle strong
	{
	color: #f5f5f5
}

@media screen and (max-width:1199px) {
	.hero.is-dark .navbar-menu {
		background-color: #363636
	}
}

.hero.is-dark .navbar-item, .hero.is-dark .navbar-link {
	color: hsla(0, 0%, 96.1%, .7)
}

.hero.is-dark .navbar-link.is-active, .hero.is-dark .navbar-link:hover,
	.hero.is-dark a.navbar-item.is-active, .hero.is-dark a.navbar-item:hover
	{
	background-color: #292929;
	color: #f5f5f5
}

.hero.is-dark .tabs a {
	color: #f5f5f5;
	opacity: .9
}

.hero.is-dark .tabs a:hover {
	opacity: 1
}

.hero.is-dark .tabs li.is-active a {
	opacity: 1
}

.hero.is-dark .tabs.is-boxed a, .hero.is-dark .tabs.is-toggle a {
	color: #f5f5f5
}

.hero.is-dark .tabs.is-boxed a:hover, .hero.is-dark .tabs.is-toggle a:hover
	{
	background-color: rgba(0, 10, 18, .1)
}

.hero.is-dark .tabs.is-boxed li.is-active a, .hero.is-dark .tabs.is-boxed li.is-active a:hover,
	.hero.is-dark .tabs.is-toggle li.is-active a, .hero.is-dark .tabs.is-toggle li.is-active a:hover
	{
	background-color: #f5f5f5;
	border-color: #f5f5f5;
	color: #363636
}

.hero.is-dark.is-bold {
	background-image: linear-gradient(141deg, #1f191a, #363636 71%, #46403f)
}

@media screen and (max-width:768px) {
	.hero.is-dark.is-bold .navbar-menu {
		background-image: linear-gradient(141deg, #1f191a, #363636 71%, #46403f)
	}
}

.hero.is-primary {
	background-color: #ff7867;
	color: #fff
}

.hero.is-primary a:not (.button ):not (.dropdown-item ):not (.tag ),
	.hero.is-primary strong {
	color: inherit
}

.hero.is-primary .title {
	color: #fff
}

.hero.is-primary .subtitle {
	color: hsla(0, 0%, 100%, .9)
}

.hero.is-primary .subtitle a:not (.button ), .hero.is-primary .subtitle strong
	{
	color: #fff
}

@media screen and (max-width:1199px) {
	.hero.is-primary .navbar-menu {
		background-color: #ff7867
	}
}

.hero.is-primary .navbar-item, .hero.is-primary .navbar-link {
	color: hsla(0, 0%, 100%, .7)
}

.hero.is-primary .navbar-link.is-active, .hero.is-primary .navbar-link:hover,
	.hero.is-primary a.navbar-item.is-active, .hero.is-primary a.navbar-item:hover
	{
	background-color: #ff614e;
	color: #fff
}

.hero.is-primary .tabs a {
	color: #fff;
	opacity: .9
}

.hero.is-primary .tabs a:hover {
	opacity: 1
}

.hero.is-primary .tabs li.is-active a {
	opacity: 1
}

.hero.is-primary .tabs.is-boxed a, .hero.is-primary .tabs.is-toggle a {
	color: #fff
}

.hero.is-primary .tabs.is-boxed a:hover, .hero.is-primary .tabs.is-toggle a:hover
	{
	background-color: rgba(0, 10, 18, .1)
}

.hero.is-primary .tabs.is-boxed li.is-active a, .hero.is-primary .tabs.is-boxed li.is-active a:hover,
	.hero.is-primary .tabs.is-toggle li.is-active a, .hero.is-primary .tabs.is-toggle li.is-active a:hover
	{
	background-color: #fff;
	border-color: #fff;
	color: #ff7867
}

.hero.is-primary.is-bold {
	background-image: linear-gradient(141deg, #ff343f, #ff7867 71%, #ffa481)
}

@media screen and (max-width:768px) {
	.hero.is-primary.is-bold .navbar-menu {
		background-image: linear-gradient(141deg, #ff343f, #ff7867 71%, #ffa481)
	}
}

.hero.is-link {
	background-color: #1dc078;
	color: #fff
}

.hero.is-link a:not (.button ):not (.dropdown-item ):not (.tag ), .hero.is-link strong
	{
	color: inherit
}

.hero.is-link .title {
	color: #fff
}

.hero.is-link .subtitle {
	color: hsla(0, 0%, 100%, .9)
}

.hero.is-link .subtitle a:not (.button ), .hero.is-link .subtitle strong
	{
	color: #fff
}

@media screen and (max-width:1199px) {
	.hero.is-link .navbar-menu {
		background-color: #1dc078
	}
}

.hero.is-link .navbar-item, .hero.is-link .navbar-link {
	color: hsla(0, 0%, 100%, .7)
}

.hero.is-link .navbar-link.is-active, .hero.is-link .navbar-link:hover,
	.hero.is-link a.navbar-item.is-active, .hero.is-link a.navbar-item:hover
	{
	background-color: #1aaa6a;
	color: #fff
}

.hero.is-link .tabs a {
	color: #fff;
	opacity: .9
}

.hero.is-link .tabs a:hover {
	opacity: 1
}

.hero.is-link .tabs li.is-active a {
	opacity: 1
}

.hero.is-link .tabs.is-boxed a, .hero.is-link .tabs.is-toggle a {
	color: #fff
}

.hero.is-link .tabs.is-boxed a:hover, .hero.is-link .tabs.is-toggle a:hover
	{
	background-color: rgba(0, 10, 18, .1)
}

.hero.is-link .tabs.is-boxed li.is-active a, .hero.is-link .tabs.is-boxed li.is-active a:hover,
	.hero.is-link .tabs.is-toggle li.is-active a, .hero.is-link .tabs.is-toggle li.is-active a:hover
	{
	background-color: #fff;
	border-color: #fff;
	color: #1dc078
}

.hero.is-link.is-bold {
	background-image: linear-gradient(141deg, #0e9c46, #1dc078 71%, #1adca7)
}

@media screen and (max-width:768px) {
	.hero.is-link.is-bold .navbar-menu {
		background-image: linear-gradient(141deg, #0e9c46, #1dc078 71%, #1adca7)
	}
}

.hero.is-info {
	background-color: #3298dc;
	color: #fff
}

.hero.is-info a:not (.button ):not (.dropdown-item ):not (.tag ), .hero.is-info strong
	{
	color: inherit
}

.hero.is-info .title {
	color: #fff
}

.hero.is-info .subtitle {
	color: hsla(0, 0%, 100%, .9)
}

.hero.is-info .subtitle a:not (.button ), .hero.is-info .subtitle strong
	{
	color: #fff
}

@media screen and (max-width:1199px) {
	.hero.is-info .navbar-menu {
		background-color: #3298dc
	}
}

.hero.is-info .navbar-item, .hero.is-info .navbar-link {
	color: hsla(0, 0%, 100%, .7)
}

.hero.is-info .navbar-link.is-active, .hero.is-info .navbar-link:hover,
	.hero.is-info a.navbar-item.is-active, .hero.is-info a.navbar-item:hover
	{
	background-color: #238cd1;
	color: #fff
}

.hero.is-info .tabs a {
	color: #fff;
	opacity: .9
}

.hero.is-info .tabs a:hover {
	opacity: 1
}

.hero.is-info .tabs li.is-active a {
	opacity: 1
}

.hero.is-info .tabs.is-boxed a, .hero.is-info .tabs.is-toggle a {
	color: #fff
}

.hero.is-info .tabs.is-boxed a:hover, .hero.is-info .tabs.is-toggle a:hover
	{
	background-color: rgba(0, 10, 18, .1)
}

.hero.is-info .tabs.is-boxed li.is-active a, .hero.is-info .tabs.is-boxed li.is-active a:hover,
	.hero.is-info .tabs.is-toggle li.is-active a, .hero.is-info .tabs.is-toggle li.is-active a:hover
	{
	background-color: #fff;
	border-color: #fff;
	color: #3298dc
}

.hero.is-info.is-bold {
	background-image: linear-gradient(141deg, #159dc6, #3298dc 71%, #4389e5)
}

@media screen and (max-width:768px) {
	.hero.is-info.is-bold .navbar-menu {
		background-image: linear-gradient(141deg, #159dc6, #3298dc 71%, #4389e5)
	}
}

.hero.is-success {
	background-color: #5eceb3;
	color: #fff
}

.hero.is-success a:not (.button ):not (.dropdown-item ):not (.tag ),
	.hero.is-success strong {
	color: inherit
}

.hero.is-success .title {
	color: #fff
}

.hero.is-success .subtitle {
	color: hsla(0, 0%, 100%, .9)
}

.hero.is-success .subtitle a:not (.button ), .hero.is-success .subtitle strong
	{
	color: #fff
}

@media screen and (max-width:1199px) {
	.hero.is-success .navbar-menu {
		background-color: #5eceb3
	}
}

.hero.is-success .navbar-item, .hero.is-success .navbar-link {
	color: hsla(0, 0%, 100%, .7)
}

.hero.is-success .navbar-link.is-active, .hero.is-success .navbar-link:hover,
	.hero.is-success a.navbar-item.is-active, .hero.is-success a.navbar-item:hover
	{
	background-color: #4ac8aa;
	color: #fff
}

.hero.is-success .tabs a {
	color: #fff;
	opacity: .9
}

.hero.is-success .tabs a:hover {
	opacity: 1
}

.hero.is-success .tabs li.is-active a {
	opacity: 1
}

.hero.is-success .tabs.is-boxed a, .hero.is-success .tabs.is-toggle a {
	color: #fff
}

.hero.is-success .tabs.is-boxed a:hover, .hero.is-success .tabs.is-toggle a:hover
	{
	background-color: rgba(0, 10, 18, .1)
}

.hero.is-success .tabs.is-boxed li.is-active a, .hero.is-success .tabs.is-boxed li.is-active a:hover,
	.hero.is-success .tabs.is-toggle li.is-active a, .hero.is-success .tabs.is-toggle li.is-active a:hover
	{
	background-color: #fff;
	border-color: #fff;
	color: #5eceb3
}

.hero.is-success.is-bold {
	background-image: linear-gradient(141deg, #2ecb8b, #5eceb3 71%, #6dd9d1)
}

@media screen and (max-width:768px) {
	.hero.is-success.is-bold .navbar-menu {
		background-image: linear-gradient(141deg, #2ecb8b, #5eceb3 71%, #6dd9d1)
	}
}

.hero.is-warning {
	background-color: #ffdd57;
	color: rgba(0, 0, 0, .7)
}

.hero.is-warning a:not (.button ):not (.dropdown-item ):not (.tag ),
	.hero.is-warning strong {
	color: inherit
}

.hero.is-warning .title {
	color: rgba(0, 0, 0, .7)
}

.hero.is-warning .subtitle {
	color: rgba(0, 0, 0, .9)
}

.hero.is-warning .subtitle a:not (.button ), .hero.is-warning .subtitle strong
	{
	color: rgba(0, 0, 0, .7)
}

@media screen and (max-width:1199px) {
	.hero.is-warning .navbar-menu {
		background-color: #ffdd57
	}
}

.hero.is-warning .navbar-item, .hero.is-warning .navbar-link {
	color: rgba(0, 0, 0, .7)
}

.hero.is-warning .navbar-link.is-active, .hero.is-warning .navbar-link:hover,
	.hero.is-warning a.navbar-item.is-active, .hero.is-warning a.navbar-item:hover
	{
	background-color: #ffd83d;
	color: rgba(0, 0, 0, .7)
}

.hero.is-warning .tabs a {
	color: rgba(0, 0, 0, .7);
	opacity: .9
}

.hero.is-warning .tabs a:hover {
	opacity: 1
}

.hero.is-warning .tabs li.is-active a {
	opacity: 1
}

.hero.is-warning .tabs.is-boxed a, .hero.is-warning .tabs.is-toggle a {
	color: rgba(0, 0, 0, .7)
}

.hero.is-warning .tabs.is-boxed a:hover, .hero.is-warning .tabs.is-toggle a:hover
	{
	background-color: rgba(0, 10, 18, .1)
}

.hero.is-warning .tabs.is-boxed li.is-active a, .hero.is-warning .tabs.is-boxed li.is-active a:hover,
	.hero.is-warning .tabs.is-toggle li.is-active a, .hero.is-warning .tabs.is-toggle li.is-active a:hover
	{
	background-color: rgba(0, 0, 0, .7);
	border-color: rgba(0, 0, 0, .7);
	color: #ffdd57
}

.hero.is-warning.is-bold {
	background-image: linear-gradient(141deg, #ffaf24, #ffdd57 71%, #fffa70)
}

@media screen and (max-width:768px) {
	.hero.is-warning.is-bold .navbar-menu {
		background-image: linear-gradient(141deg, #ffaf24, #ffdd57 71%, #fffa70)
	}
}

.hero.is-danger {
	background-color: #f14668;
	color: #fff
}

.hero.is-danger a:not (.button ):not (.dropdown-item ):not (.tag ),
	.hero.is-danger strong {
	color: inherit
}

.hero.is-danger .title {
	color: #fff
}

.hero.is-danger .subtitle {
	color: hsla(0, 0%, 100%, .9)
}

.hero.is-danger .subtitle a:not (.button ), .hero.is-danger .subtitle strong
	{
	color: #fff
}

@media screen and (max-width:1199px) {
	.hero.is-danger .navbar-menu {
		background-color: #f14668
	}
}

.hero.is-danger .navbar-item, .hero.is-danger .navbar-link {
	color: hsla(0, 0%, 100%, .7)
}

.hero.is-danger .navbar-link.is-active, .hero.is-danger .navbar-link:hover,
	.hero.is-danger a.navbar-item.is-active, .hero.is-danger a.navbar-item:hover
	{
	background-color: #ef2e55;
	color: #fff
}

.hero.is-danger .tabs a {
	color: #fff;
	opacity: .9
}

.hero.is-danger .tabs a:hover {
	opacity: 1
}

.hero.is-danger .tabs li.is-active a {
	opacity: 1
}

.hero.is-danger .tabs.is-boxed a, .hero.is-danger .tabs.is-toggle a {
	color: #fff
}

.hero.is-danger .tabs.is-boxed a:hover, .hero.is-danger .tabs.is-toggle a:hover
	{
	background-color: rgba(0, 10, 18, .1)
}

.hero.is-danger .tabs.is-boxed li.is-active a, .hero.is-danger .tabs.is-boxed li.is-active a:hover,
	.hero.is-danger .tabs.is-toggle li.is-active a, .hero.is-danger .tabs.is-toggle li.is-active a:hover
	{
	background-color: #fff;
	border-color: #fff;
	color: #f14668
}

.hero.is-danger.is-bold {
	background-image: linear-gradient(141deg, #fa0a62, #f14668 71%, #f7595f)
}

@media screen and (max-width:768px) {
	.hero.is-danger.is-bold .navbar-menu {
		background-image: linear-gradient(141deg, #fa0a62, #f14668 71%, #f7595f)
	}
}

.hero.is-small .hero-body {
	padding-bottom: 1.5rem;
	padding-top: 1.5rem
}

@media print , screen and (min-width:769px) {
	.hero.is-medium .hero-body {
		padding-bottom: 9rem;
		padding-top: 9rem
	}
}

@media print , screen and (min-width:769px) {
	.hero.is-large .hero-body {
		padding-bottom: 18rem;
		padding-top: 18rem
	}
}

.hero.is-fullheight-with-navbar .hero-body, .hero.is-fullheight .hero-body,
	.hero.is-halfheight .hero-body {
	align-items: center;
	display: flex
}

.hero.is-fullheight-with-navbar .hero-body>.container, .hero.is-fullheight .hero-body>.container,
	.hero.is-halfheight .hero-body>.container {
	flex-grow: 1;
	flex-shrink: 1
}

.hero.is-halfheight {
	min-height: 50vh
}

.hero.is-fullheight {
	min-height: 100vh
}

.hero-video {
	overflow: hidden
}

.hero-video video {
	left: 50%;
	min-height: 100%;
	min-width: 100%;
	position: absolute;
	top: 50%;
	transform: translate3d(-50%, -50%, 0)
}

.hero-video.is-transparent {
	opacity: .3
}

@media screen and (max-width:768px) {
	.hero-video {
		display: none
	}
}

.hero-buttons {
	margin-top: 1.5rem
}

@media screen and (max-width:768px) {
	.hero-buttons .button {
		display: flex
	}
	.hero-buttons .button:not (:last-child ){
		margin-bottom: .75rem
	}
}

@media print , screen and (min-width:769px) {
	.hero-buttons {
		display: flex;
		justify-content: center
	}
	.hero-buttons .button:not (:last-child ){
		margin-right: 1.5rem
	}
}

.hero-foot, .hero-head {
	flex-grow: 0;
	flex-shrink: 0
}

.hero-body {
	flex-grow: 1;
	flex-shrink: 0
}

.hero-body, .section {
	padding: 3rem 1.5rem
}

@media screen and (min-width:1200px) {
	.section.is-medium {
		padding: 9rem 1.5rem
	}
	.section.is-large {
		padding: 18rem 1.5rem
	}
}

.footer {
	background-color: #fafafa;
	padding: 3rem 1.5rem 6rem
}

*, :after, :before {
	box-sizing: inherit
}

:focus {
	outline: .05em auto #1dc078
}

html {
	position: relative;
	overflow-x: hidden;
	overflow-y: scroll;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	min-width: 300px;
	min-height: 100%;
	background-color: #fff;
	touch-action: manipulation;
	-webkit-tap-highlight-color: transparent;
	-webkit-text-size-adjust: 100%;
	-moz-text-size-adjust: 100%;
	-ms-text-size-adjust: 100%;
	line-height: 1.625;
	scroll-behavior: smooth
}

html.noscroll {
	overflow: hidden
}

body {
	text-rendering: optimizeSpeed;
	-webkit-text-size-adjust: 100%;
	-moz-text-size-adjust: 100%;
	-ms-text-size-adjust: 100%;
	text-size-adjust: 100%;
	overflow-x: hidden;
	min-height: 100vh;
	color: #000a12;
	background-color: #fff
}

body, h1 {
	margin: 0
}

ol, ul {
	list-style: none
}

a {
	color: currentColor;
	text-decoration: none;
	cursor: pointer
}

a:hover {
	color: #454545
}

a strong {
	color: currentColor
}

strong {
	color: #000a12;
	font-weight: 700
}

small {
	font-size: .875em
}

span {
	font-weight: inherit;
	font-style: inherit
}

.visually_hidden {
	border: 0;
	margin: -1px;
	clip: rect(0, 0, 0, 0);
	height: 1px;
	overflow: hidden;
	padding: 0;
	position: absolute;
	width: 1px
}

.visually-hidden .skip:focus {
	position: static;
	width: auto;
	height: auto
}

input::-webkit-input-placeholder {
	color: #9c9c9c;
	font-size: .9rem
}

input::-moz-placeholder {
	color: #9c9c9c;
	font-size: .9rem
}

input:-ms-input-placeholder {
	color: #9c9c9c;
	font-size: .9rem
}

input::-ms-input-placeholder {
	color: #9c9c9c;
	font-size: .9rem
}

input::placeholder {
	color: #9c9c9c;
	font-size: .9rem
}

p {
	margin: 0;
	line-height: 1.6
}

@media screen and (min-width:1473px) {
	.container {
		max-width: 1440px;
		width: 1440px
	}
}

@media screen and (max-width:1024px) {
	.container {
		padding: 1rem
	}
}

@media screen and (max-width:768px) {
	.container {
		padding: .5rem
	}
}

.columns, .columns:last-child {
	margin: 0
}

.box {
	border-radius: 1px
}

.content {
	word-break: break-word
}

.content h1 {
	font-size: 2.25rem
}

.content h2 {
	font-size: 2rem
}

.content h3 {
	font-size: 1.75rem
}

.content h4 {
	font-size: 1.5rem
}

.content h5 {
	font-size: 1.25rem
}

.content h6 {
	font-size: 1.125rem
}

.content p {
	font-size: 16px
}

.content code, .content pre {
	padding: .2rem;
	background-color: #f5f5f5
}

.content blockquote {
	padding: 1rem
}

.progress {
	border-radius: 0;
	height: 18px
}

.image img.is-rounded {
	-o-object-fit: cover;
	object-fit: cover;
	width: 100%;
	height: 100%
}

.navbar-dropdown.is-boxed, .navbar.is-spaced .navbar-dropdown {
	transition: none
}

.modal-card .modal-card-body {
	padding-bottom: 0
}

.modal-card .modal-card-foot {
	border-top: none
}

h1 {
	font-size: 2.25rem
}

h2 {
	font-size: 2rem
}

h3 {
	font-size: 1.75rem
}

h4 {
	font-size: 1.5rem
}

h5 {
	font-size: 1.25rem
}

h6 {
	font-size: 1.125rem
}

p {
	font-size: 16px
}

img {
	max-width: 100%;
	display: block
}

.fw-bold {
	font-weight: 600
}

.fw-normal {
	font-weight: 500
}

.fw-light {
	font-weight: 300
}

.space-inset-2 {
	padding: 4px
}

.space-inset-4 {
	padding: 8px
}

.space-inset-6 {
	padding: 12px
}

.space-inset-8 {
	padding: 16px
}

.space-inset-10 {
	padding: 20px
}

.space-inset-12 {
	padding: 24px
}

.space-inset-stretch-2 {
	padding: 4px 8px
}

.space-inset-stretch-4 {
	padding: 8px 12px
}

.space-inset-stretch-5 {
	padding: 10px 16px
}

.space-inset-stretch-6 {
	padding: 12px 16px
}

.space-inset-stretch-8, .space-inset-stretch-12 {
	padding: 16px 24px
}

.space-inline-right-1 {
	padding-right: 2px
}

.space-inline-right-2 {
	padding-right: 4px
}

.space-inline-right-4 {
	padding-right: 8px
}

.space-inline-right-6 {
	padding-right: 12px
}

.space-inline-right-8 {
	padding-right: 16px
}

.space-inline-right-13 {
	padding-right: 36px
}

.space-inline-left-1 {
	padding-left: 2px
}

.space-inline-left-2 {
	padding-left: 4px
}

.space-inline-left-4 {
	padding-left: 8px
}

.space-inline-left-6 {
	padding-left: 12px
}

.space-inline-left-8 {
	padding-left: 8px
}

.space-inline-left-13 {
	padding-left: 36px
}

.space-stack-1 {
	margin-bottom: 2px
}

.space-stack-2 {
	margin-bottom: 4px
}

.space-stack-4 {
	margin-bottom: 8px
}

.space-stack-6 {
	margin-bottom: 12px
}

.space-stack-8 {
	margin-bottom: 16px
}

.space-stack-10 {
	margin-bottom: 20px
}

.space-stack-12 {
	margin-bottom: 24px
}

.space-stack-16 {
	margin-bottom: 32px
}

.space-stack-18 {
	margin-bottom: 36px
}

.space-stack-24 {
	margin-bottom: 48px
}

.space-stack-28 {
	margin-bottom: 56px
}

.space-stack-32 {
	margin-bottom: 64px
}

.space-stack-40 {
	margin-bottom: 80px
}

.container {
	flex-grow: 1;
	margin: 0 auto;
	position: relative;
	width: auto
}

.container.is-fluid {
	max-width: none;
	padding-left: 10px;
	padding-right: 10px;
	width: 100%
}

@media screen and (min-width:1200px) {
	.container {
		max-width: 1180px
	}
}

.button .icon {
	width: 1rem;
	height: 1rem
}

.button .icon:first-child:last-child {
	margin-left: unset;
	margin-right: unset
}

.button .icon:last-child:not (:first-child ){
	margin-left: .25rem;
	margin-right: unset
}

.button.is-brand {
	background: #00c471;
	color: #fff
}

.input {
	height: auto
}

.icon {
	box-sizing: content-box;
	font-size: inherit;
	width: 1rem;
	height: 1rem;
	line-height: 1
}

.icon.circle {
	border-radius: 50%
}

.box {
	background-color: #fff;
	border-radius: 4px;
	color: #333
}

.title {
	line-height: 1.5;
	color: #333
}

@media screen and (max-width:768px) {
	.title.is-2 {
		font-size: 1.5rem
	}
	.title.is-1 {
		font-size: 2rem
	}
	.title.is-4 {
		font-size: 1.25rem
	}
	.title.is-5 {
		font-size: 1.375rem
	}
	.title.is-6 {
		font-size: 1.125rem
	}
	.title.is-7 {
		font-size: 1rem
	}
}

.title.is-1 {
	line-height: 1.318
}

.title.is-2 {
	line-height: 1.33
}

.subtitle {
	line-height: 1.5;
	color: #333
}

.subtitle.is-1 {
	line-height: 1.318
}

.subtitle.is-2 {
	line-height: 1.33
}

.text.is-1 {
	font-size: 1rem
}

.text.is-2 {
	font-size: .9375rem
}

.text.is-3 {
	font-size: .875rem
}

.text.is-4 {
	font-size: .8125rem
}

.text.is-5 {
	font-size: .75rem
}

@media screen and (max-width:768px) {
	.text.is-1 {
		font-size: .9375rem
	}
	.text.is-3 {
		font-size: .875rem
	}
	.text.is-4 {
		font-size: .8125rem
	}
	.text.is-5 {
		font-size: .75rem
	}
}

.subtext.is-1 {
	font-size: 1rem
}

.subtext.is-2 {
	font-size: .9375rem
}

.subtext.is-3 {
	font-size: .875rem
}

.subtext.is-4 {
	font-size: .8125rem
}

.subtext.is-5 {
	font-size: .75rem
}

div:not (.course_description ) .content li+li {
	margin-top: unset
}

div:not (.course_description ) .content ul {
	list-style: none;
	margin-left: unset;
	margin-top: unset
}

div:not (.course_description ) .content ul ul {
	list-style-type: none;
	margin-top: unset
}

div:not (.course_description ) .content ul ul ul {
	list-style-type: none
}

nav.breadcrumb:not (:last-child ){
	margin-bottom: 0
}

nav.breadcrumb ul {
	align-items: baseline
}

nav.breadcrumb ul li>a {
	color: #929292
}

.flat_button {
	border: none
}

.has-dropdown.category_menu .navbar-dropdown.is-boxed {
	width: 180px;
	height: 410px;
	border-radius: 0;
	box-shadow: 8px 5px 8px 1px rgba(0, 10, 18, .1), 0 0 0 1px
		rgba(0, 10, 18, .1)
}

.has-dropdown.category_menu .navbar-dropdown.is-boxed .step_menu {
	display: none;
	position: absolute;
	top: 0
}

.has-dropdown.category_menu .navbar-dropdown.is-boxed .step_2,
	.has-dropdown.category_menu .navbar-dropdown.is-boxed .step_2 .step_3 {
	left: 180px;
	width: 180px
}

.has-dropdown.category_menu .navbar-dropdown.is-boxed .step_2 .step_3 li
	{
	width: 280px
}

.has-dropdown.category_menu .navbar-dropdown.is-boxed .step_2 .step_3 li a.navbar-item:hover
	{
	background: none
}

.has-dropdown.category_menu .navbar-dropdown.is-boxed>li:last-child {
	height: 50%
}

.has-dropdown.category_menu .navbar-dropdown.is-boxed>li:hover>.step_menu
	{
	display: block
}

.has-dropdown.category_menu .navbar-dropdown.is-boxed>li:hover>a {
	color: #1dc078
}

.has-dropdown .navbar-dropdown.is-boxed {
	border-radius: 2px
}

.has-dropdown .navbar-dropdown img {
	max-width: inherit;
	max-height: inherit
}

@media screen and (min-width:768px) {
	.has-dropdown.tab_active:after, .has-dropdown:hover:after {
		content: "";
		border-color: transparent transparent #fff;
		border-style: solid;
		border-width: 0 10px 10px;
		position: absolute;
		width: 1rem;
		height: 1rem;
		top: 46px;
		right: 0;
		left: 0;
		z-index: 21;
		margin: 0 auto
	}
	.has-dropdown.tab_active:before, .has-dropdown:hover:before {
		content: "";
		position: absolute;
		border-color: transparent transparent #ececec;
		border-style: solid;
		border-width: 0 11px 11px;
		width: 1rem;
		height: 1rem;
		top: 45px;
		right: 0;
		left: 0;
		margin: 0 auto;
		z-index: 20
	}
	.has-dropdown a.navbar-item {
		padding-right: 1rem
	}
}

.atom_dropdown {
	position: relative;
	display: flex;
	justify-content: center;
	align-self: stretch;
	align-items: center;
	min-width: 2.5rem
}

.atom_dropdown .menu {
	display: none;
	position: absolute;
	background: #fff;
	min-width: 160px;
	top: 60px;
	box-shadow: 0 14px 16px 0 hsla(0, 0%, 76.9%, .13);
	border: 1px solid #ececec;
	z-index: 1
}

.atom_dropdown .menu .item {
	color: #454545;
	padding: 12px 16px;
	text-decoration: none;
	display: block
}

.atom_dropdown .menu .item:hover {
	background: #efefef
}

.atom_dropdown .menu .item.has_divider {
	border-top: 1px solid #ececec
}

.atom_dropdown.left .menu {
	left: 0
}

.atom_dropdown.right .menu {
	right: 0
}

.atom_dropdown.tab_active .menu, .atom_dropdown:hover .menu {
	display: block
}

.atom_dropdown.tab_active:after, .atom_dropdown:hover:after {
	content: "";
	border-color: transparent transparent #fff;
	border-style: solid;
	border-width: 0 10px 13px;
	position: absolute;
	width: 1rem;
	height: 1rem;
	top: 45px;
	right: 0;
	left: 0;
	z-index: 3;
	margin: 0 auto
}

.atom_dropdown.tab_active:before, .atom_dropdown:hover:before {
	content: "";
	position: absolute;
	border-color: transparent transparent #ececec;
	border-style: solid;
	border-width: 0 11px 15px;
	width: 1rem;
	height: 1rem;
	top: 44px;
	right: 0;
	left: 0;
	margin: 0 auto;
	z-index: 2
}

.icon_button {
	background: none;
	border: none;
	padding: 0;
	border-radius: 0;
	box-shadow: none;
	display: inline-block;
	line-height: 1;
	font-size: 1px;
	height: auto
}

.icon_button:active, .icon_button:focus {
	outline: .05em auto #1dc078;
	border: 0;
	box-shadow: 0
}

.icon_button svg {
	width: 1.2rem;
	height: 1.2rem
}

.atom_button.button:active, .atom_button.button:focus {
	outline: .05em auto #1dc078;
	border: 0;
	box-shadow: 0
}

.atom_button.button a:hover {
	color: #fff
}

.input {
	border-radius: 3px;
	box-shadow: none;
	background: #f6f6f6;
	color: #5f5f5f;
	border: 1px solid transparent
}

.input:active, .input:focus {
	outline: .04rem auto #1dc078
}

.label {
	font-size: .85rem;
	font-weight: 400;
	color: #929292
}

.label:not (:last-child ){
	margin-bottom: .2rem
}

.atom_field {
	display: grid;
	width: 100%;
	margin-bottom: 0
}

.atom_field:not (:last-child ){
	margin-bottom: 0
}

.atom_field .label {
	font-size: .85rem;
	font-weight: 400;
	color: #929292
}

.atom_field .label:not (:last-child ){
	margin-bottom: .2rem
}

.atom_field .input {
	background: #f6f6f6;
	height: 44px;
	border-radius: 3px;
	font-size: 1rem;
	color: #5f5f5f;
	box-shadow: none;
	border: 0
}

.atom_field .input:active, .atom_field .input:focus {
	outline: .04rem auto #1dc078
}

.atom_field.atom_searchbar {
	grid-template-columns: 1fr fit-content(16rem);
	justify-items: end;
	grid-column-gap: 10px;
	align-items: center;
	border: 0;
	border-radius: 3px;
	background: #f6f6f6;
	padding-right: 10px
}

.atom_field.atom_searchbar .input {
	height: 35px;
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
	background: #f6f6f6
}

.atom_checkbox {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: .85rem;
	margin-left: -20px;
	color: #787878
}

.atom_checkbox input[type=checkbox] {
	opacity: 0
}

.atom_checkbox input[type=checkbox]+label:after {
	content: none
}

.atom_checkbox input[type=checkbox]:checked+label:after {
	content: ""
}

.atom_checkbox input[type=checkbox]:focus+label:before {
	outline: .05em auto #1dc078
}

.atom_checkbox * {
	cursor: pointer
}

.atom_checkbox label.right {
	display: flex;
	align-items: center;
	position: relative
}

.atom_checkbox label.right:after, .atom_checkbox label.right:before {
	position: absolute;
	content: "";
	display: inline-block
}

.atom_checkbox label.right:before {
	top: 5px;
	right: -20px;
	height: .85rem;
	width: .85rem;
	border: 1px solid #d2d2d2;
	border-radius: 3px;
	background: #f6f6f6
}

.atom_checkbox label.right:after {
	top: 8px;
	right: -17.5px;
	height: 5px;
	width: 8px;
	border-left: 2px solid;
	border-bottom: 2px solid;
	transform: rotate(-45deg)
}

.atom_checkbox label.left {
	display: flex;
	align-items: center;
	position: relative
}

.atom_checkbox label.left:after, .atom_checkbox label.left:before {
	position: absolute;
	content: "";
	display: inline-block
}

.atom_checkbox label.left:before {
	top: 5px;
	left: -20px;
	height: .85rem;
	width: .85rem;
	border: 1px solid #d2d2d2;
	border-radius: 3px;
	background: #f6f6f6
}

.atom_checkbox label.left:after {
	top: 8px;
	right: -17.5px;
	height: 5px;
	width: 8px;
	border-left: 2px solid;
	border-bottom: 2px solid;
	transform: rotate(-45deg)
}

#icon_brand_logo path {
	fill: #1dc078
}

.animation_circle_check .path {
	stroke-dasharray: 1000;
	stroke-dashoffset: 0
}

.animation_circle_check .path.circle {
	-webkit-animation: dash .9s ease-in-out;
	animation: dash .9s ease-in-out
}

.animation_circle_check .path.line {
	stroke-dashoffset: 1000;
	-webkit-animation: dash .9s ease-in-out .35s forwards;
	animation: dash .9s ease-in-out .35s forwards
}

.animation_circle_check .path.check {
	stroke-dashoffset: -100;
	-webkit-animation: dash-check .9s ease-in-out .35s forwards;
	animation: dash-check .9s ease-in-out .35s forwards
}

@
-webkit-keyframes dash { 0%{
	stroke-dashoffset: 1000
}

to {
	stroke-dashoffset: 0
}

}
@
keyframes dash { 0%{
	stroke-dashoffset: 1000
}

to {
	stroke-dashoffset: 0
}

}
@
-webkit-keyframes dash-check { 0%{
	stroke-dashoffset: -100
}

to {
	stroke-dashoffset: 900
}

}
@
keyframes dash-check { 0%{
	stroke-dashoffset: -100
}

to {
	stroke-dashoffset: 900
}

}
.oops.no_video {
	max-width: 700px;
	max-height: 400px;
	width: 100%;
	height: 100%;
	background: #00f
}

a.atom_link_tmpl, a.course_link_tmpl {
	display: flex;
	align-items: center;
	padding-left: .25rem;
	width: 100%;
	max-width: 480px
}

a.atom_link_tmpl:hover, a.course_link_tmpl:hover {
	color: #1dc078
}

a.atom_link_tmpl.box, a.course_link_tmpl.box {
	padding: .5rem
}

a.atom_link_tmpl .left, a.course_link_tmpl .left {
	width: 2rem;
	height: 2rem;
	min-width: 2rem;
	min-height: 2rem;
	text-align: center;
	vertical-align: middle
}

a.atom_link_tmpl .left i, a.course_link_tmpl .left i {
	font-size: 1.5rem;
	line-height: inherit
}

a.atom_link_tmpl .right_title, a.course_link_tmpl .right_title {
	width: 100%;
	padding-left: .5rem
}

a.atom_link_tmpl .right_title .roadmap_title, a.course_link_tmpl .right_title .roadmap_title
	{
	max-height: 3.3rem;
	overflow: hidden;
	word-wrap: break-word;
	white-space: normal;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical
}

a.atom_link_tmpl .right_title .roadmap_student, a.course_link_tmpl .right_title .roadmap_student
	{
	font-size: .75rem;
	color: #cfcfcf
}

a.atom_link_tmpl .right_title .roadmap_student span+span, a.course_link_tmpl .right_title .roadmap_student span+span
	{
	margin-left: .25rem
}

.inf_progress label {
	font-size: .8rem
}

.inf_progress progress {
	height: 6px;
	border-radius: 0;
	margin-top: .4rem
}

.rating_star {
	position: relative;
	width: 5rem;
	display: inline-block
}

.rating_star .star_solid {
	position: absolute;
	display: inline;
	top: 0;
	left: 0;
	overflow: hidden;
	white-space: nowrap
}

.rating_star svg {
	color: #fdcc11;
	width: 1rem;
	height: 1rem
}

@media screen and (max-width:768px) {
	.rating_star {
		width: 4rem
	}
	.rating_star svg {
		width: .8rem
	}
}

.search.search_bar svg {
	position: absolute;
	right: 1.2rem
}

@media screen and (max-width:768px) {
	.search.search_bar svg {
		top: 1.2rem
	}
}

.atom_link_text {
	font-size: inherit;
	color: #1dc078;
	display: inline-block
}

.atom_paragraph {
	text-align: center;
	color: #929292
}

.atom_paragraph a {
	color: #1dc078
}

#admin_main .aside_wrap {
	background-color: #282f37;
	min-height: 60rem
}

#admin_main .aside_wrap .menu-list .btn_wrap {
	color: #fff
}

#admin_main .aside_wrap .menu-list .btn_wrap.is_active {
	background-color: #1dc078;
	font-weight: 600
}

#admin_main .aside_wrap .menu-list a:hover {
	background-color: #1dc078
}

#admin_main .aside_wrap .menu-list a:hover span {
	color: #fff
}

#admin_main .aside_wrap .menu-list i {
	color: #fff;
	margin-right: .6rem
}

@media screen and (max-width:768px) {
	#admin_main .aside_wrap {
		position: absolute;
		width: 100%;
		z-index: 100;
		transform: translateX(-100%)
	}
	#admin_main .aside_wrap.is_active {
		display: block;
		transform: translateX(0);
		height: 100%
	}
	#admin_main .content_wrap {
		width: 100%
	}
	.admin_header .header_burger {
		height: 48px;
		z-index: 100;
		position: fixed;
		display: block;
		color: #fff
	}
}

.admin_header {
	left: 0;
	right: 0;
	z-index: 72;
	background: #282f37
}

.admin_header .column {
	padding: 0
}

.admin_header .is-2 {
	max-width: 252px
}

.admin_header nav {
	height: 64px;
	display: flex;
	width: 100%;
	justify-content: space-between;
	align-items: center
}

.admin_header nav h1 {
	height: 100%
}

.admin_header nav h1 a.brand_logo {
	display: flex;
	align-items: center;
	height: 100%
}

.admin_header nav h1 #icon_brand_logo {
	width: 100px
}

.admin_header nav h1 .suffix {
	color: #fff;
	font-size: .5rem;
	font-weight: 800;
	font-style: italic;
	margin-top: 1rem
}

.admin_header nav .admin_info a+a {
	margin-left: 1rem
}

.admin_header nav .admin_info a {
	color: #fff;
	font-size: .8rem;
	font-weight: 700;
	-webkit-text-decoration-line: underline;
	text-decoration-line: underline
}

@media screen and (max-width:768px) {
	.admin_header .is-2 {
		display: none
	}
	.admin_header .is-10 {
		width: 100%
	}
	.admin_header nav {
		height: 48px;
		justify-content: center
	}
	.admin_header nav .admin_info {
		position: absolute;
		right: .5rem
	}
	.admin_header nav .admin_info a {
		font-size: .625rem
	}
}

.button.e_api_coupon {
	margin-top: .5rem;
	padding: .75rem 0;
	height: auto;
	border-radius: 2px;
	font-weight: 700
}

.modal>.signin_modal {
	width: 360px;
	height: 530px;
	overflow-y: scroll;
	background: #fff;
	position: absolute;
	border-radius: 3px;
	top: 0;
	right: 0;
	left: 0;
	bottom: 0;
	margin: auto;
	padding: 32px
}

.modal>.signin_modal #icon_brand_logo {
	width: 134px;
	height: 26px
}

.modal>.signin_modal #icon_brand_logo path {
	fill: #1dc078
}

.modal>.signin_modal .atom_button {
	font-weight: 700;
	background: #1dc078;
	border: 0;
	border-radius: 3px;
	height: 44px;
	color: #fff
}

.modal>.signin_modal .header {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center
}

.modal>.signin_modal .header .icon_button {
	position: absolute;
	top: -10px;
	right: -10px
}

.modal>.signin_modal .main_form {
	margin-top: 32px;
	display: grid;
	grid-template-rows: repeat(1, 1fr);
	grid-row-gap: 1rem
}

.modal>.signin_modal .main_form .signin {
	border-radius: 3px;
	border: none;
	background: #1dc078;
	color: #fff;
	font-size: .875rem
}

.modal>.signin_modal .sub_form {
	margin-top: 16px;
	font-size: .8rem;
	color: grey;
	text-align: center
}

.modal>.signin_modal .sub_form>a {
	display: inline-block;
	margin-top: 4px;
	-webkit-text-decoration-line: underline;
	text-decoration-line: underline
}

.modal>.signin_modal .footer_form {
	margin-top: 16px;
	text-align: center
}

.modal>.signin_modal .footer_form>span {
	color: #454545;
	font-size: .8rem
}

.modal>.signin_modal .footer_form>.social {
	margin-top: 8px;
	display: grid;
	height: 72px;
	grid-template: repeat(2, 1fr)/repeat(2, 1fr);
	grid-row-gap: 5px;
	grid-column-gap: 9px
}

.modal>.signin_modal .footer_form>.social a {
	display: flex;
	justify-content: center;
	align-items: center;
	border: 1px solid #d5d5d5
}

.modal>.signin_modal .footer_form>.social a i {
	color: #979797;
	margin-right: .2rem
}

.modal>.signin_modal .footer_form>.social a i.fa-google {
	font-size: .825rem
}

.modal>.signin_modal .footer_form>.social a span {
	font-size: .825rem;
	margin-left: .2rem;
	font-weight: 800;
	color: #979797
}

@media screen and (max-width:768px) {
	.modal>.signin_modal {
		width: 100%;
		height: inherit
	}
}

.courses_slide_tmpl.section, .inf_slider.section {
	position: relative
}

.courses_slide_tmpl.section .courses_group_title, .inf_slider.section .courses_group_title
	{
	padding: 0 .75rem;
	position: relative
}

.courses_slide_tmpl.section .courses_group_title h1, .inf_slider.section .courses_group_title h1
	{
	font-size: 1.5rem
}

.courses_slide_tmpl.section .courses_group_title h1 a.more, .inf_slider.section .courses_group_title h1 a.more
	{
	position: absolute;
	right: 1rem;
	bottom: 0;
	font-size: 1rem
}

.courses_slide_tmpl.section .slider_container, .inf_slider.section .slider_container
	{
	overflow: scroll;
	-webkit-overflow-scrolling: touch
}

.courses_slide_tmpl.section .slider_container::-webkit-scrollbar,
	.inf_slider.section .slider_container::-webkit-scrollbar {
	display: none
}

.courses_slide_tmpl.section .slider_container>.columns, .inf_slider.section .slider_container>.columns
	{
	transform: translateX(-100%)
}

.courses_slide_tmpl.section .btn, .inf_slider.section .btn {
	position: absolute;
	top: calc(50% - 24px);
	width: 3rem;
	height: 3rem;
	display: inline-block;
	background-color: #fff;
	box-shadow: 0 2px 3px rgba(0, 10, 18, .1), 0 0 0 1px rgba(0, 10, 18, .1);
	outline: none;
	cursor: pointer;
	border-radius: 10rem;
	border: none;
	opacity: .8;
	font: 400 11px system-ui;
	text-align: center;
	padding: .5rem
}

.courses_slide_tmpl.section .btn:hover, .inf_slider.section .btn:hover {
	box-shadow: none;
	opacity: 1
}

.courses_slide_tmpl.section .btn.move_left, .inf_slider.section .btn.move_left
	{
	left: -1rem
}

.courses_slide_tmpl.section .btn.move_right, .inf_slider.section .btn.move_right
	{
	right: -1rem
}

@media screen and (max-width:768px) {
	.courses_slide_tmpl.section .btn, .inf_slider.section .btn {
		top: calc(50% - 20px);
		padding: .5rem;
		width: 2.5rem;
		height: 2.5rem;
		background-color: #000;
		opacity: .5;
		z-index: 9
	}
	.courses_slide_tmpl.section .btn.move_left, .inf_slider.section .btn.move_left
		{
		left: 0
	}
	.courses_slide_tmpl.section .btn.move_right, .inf_slider.section .btn.move_right
		{
		right: 0
	}
	.courses_slide_tmpl.section .btn>i, .inf_slider.section .btn>i {
		font-size: 1.5rem;
		color: #fff;
		opacity: 1
	}
}

.chitchats {
	margin-top: 16px
}

.chitchat-item {
	position: relative;
	padding: 1.5rem 0 0;
	display: flex;
	align-items: flex-start
}

.chitchat-item .image.is-48x48 {
	min-width: 3rem;
	margin-top: .25rem
}

.chitchat-item .content {
	margin-left: 12px;
	width: 100%
}

.chitchat-item .content .author .author_name {
	font-size: 14px;
	font-weight: 800;
	line-height: 1;
	color: #333
}

.chitchat-item .content .author .created_at {
	opacity: .92;
	font-size: 14px;
	line-height: 1;
	color: #929292
}

.chitchat-item .content .body {
	white-space: pre-line
}

.chitchat-item .content .summary_comments>a>span, .chitchat-item .content a.edit-chitchat,
	.chitchat-item .content a.edit-cmt {
	color: #209cee;
	font-size: .875rem
}

.chitchat-item .content .summary_comments>a {
	font-size: .875rem
}

.chitchat-cmt-item {
	position: relative;
	padding: 8px;
	display: flex;
	align-items: flex-start
}

.chitchat-cmt-item .content {
	margin-left: 12px;
	width: 100%
}

.chitchat-cmt-item .content .author .author_name {
	font-size: 14px;
	font-weight: 800;
	line-height: 1;
	color: #333
}

.chitchat-cmt-item .content .author .created_at {
	opacity: .92;
	font-size: 14px;
	line-height: 1;
	color: #929292
}

.chitchat-cmt-item .content .body {
	white-space: pre-line
}

.comments {
	padding: 16px
}

.comments>.list {
	box-shadow: none
}

.comments>.list .comment {
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 16px;
	margin-bottom: 16px
}

.coupon_item_horizontal {
	position: relative;
	margin: auto;
	height: 78px;
	padding: .5rem;
	border-radius: 4px;
	-moz-border-radius-topleft: 1rem;
	-moz-border-radius-bottomleft: 1rem;
	border: 1px solid #dedede;
	border-left: .5rem solid #2ec276;
	background-color: #fff;
	cursor: pointer
}

.coupon_item_horizontal .coupon_title {
	font-size: 13px;
	letter-spacing: normal;
	color: #595959
}

.coupon_item_horizontal .meta {
	position: absolute;
	bottom: .25rem;
	color: #2ec276;
	font-size: .75rem
}

.coupon_item_horizontal .meta .discount_price {
	margin-left: .25rem;
	font-size: 19px;
	font-weight: 700
}

.coupon_item_horizontal .meta.cant_use .coupon_title {
	opacity: .5
}

.coupon_item_horizontal .info_icon {
	position: absolute;
	bottom: .25rem;
	right: .5rem;
	color: #b0b0b0
}

.coupon_item_container {
	position: relative;
	overflow: hidden
}

.coupon_item_container .coupon_item_vertical {
	position: relative;
	margin: auto;
	padding: 1rem;
	height: 211px;
	border: 1px solid #dedede;
	border-radius: 6px;
	background-color: #fff;
	cursor: pointer
}

.coupon_item_container .coupon_item_vertical .coupon_info_container .coupon_title
	{
	font-size: 14px;
	color: #333
}

.coupon_item_container .coupon_item_vertical .coupon_info_container .meta .discount_price
	{
	margin-top: .75rem;
	color: #2ec276;
	font-size: 19px;
	font-weight: 700
}

.coupon_item_container .coupon_item_vertical .coupon_info_container .meta .order_metas
	{
	margin-top: .75rem
}

.coupon_item_container .coupon_item_vertical .coupon_info_container .meta .order_metas li
	{
	font-size: 11px;
	color: #929292
}

.coupon_item_container .coupon_item_vertical .applicable_courses {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	padding: 1rem;
	border-top: 2px dashed #dedede;
	color: #595959;
	font-size: 14px;
	font-weight: 700;
	text-align: center;
	background-color: #f8fffb;
	border-bottom-right-radius: 6px;
	border-bottom-left-radius: 6px
}

.coupon_item_container .coupon_item_vertical:after,
	.coupon_item_container .coupon_item_vertical:before {
	content: "";
	position: absolute;
	width: .5rem;
	height: .5rem;
	border: 1px solid #dedede;
	border-radius: 999999px;
	top: 148px;
	background: #fff;
	z-index: 99
}

.coupon_item_container .coupon_item_vertical:before {
	left: -.25rem
}

.coupon_item_container .coupon_item_vertical:after {
	right: -.25rem
}

.coupon_item_container .coupon_item_vertical .is_closed_coupon {
	width: 100%;
	position: absolute;
	background-color: #fff;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	margin: auto
}

.coupon_item_container .coupon_item_vertical_2 {
	position: relative;
	margin: auto;
	padding: .25rem 0;
	height: 9rem;
	border: 2px solid #dedede;
	border-radius: 6px;
	background-color: #fff;
	cursor: pointer
}

.coupon_item_container .coupon_item_vertical_2 .discount_price {
	width: 100%;
	padding: 0 0 .2rem;
	font-size: 18px;
	font-weight: 700;
	line-height: 1.5;
	letter-spacing: normal;
	color: #2ec276;
	text-align: center;
	border-top-right-radius: 6px;
	border-top-left-radius: 6px
}

.coupon_item_container .coupon_item_vertical_2 .coupon_info_container {
	border-top: 2px dashed #dedede;
	padding: .25rem
}

.coupon_item_container .coupon_item_vertical_2 .coupon_info_container .meta .order_metas
	{
	margin-top: .25rem
}

.coupon_item_container .coupon_item_vertical_2 .coupon_info_container .meta .order_metas li
	{
	color: #676767;
	font-size: 13px
}

.coupon_item_container .coupon_item_vertical_2 .coupon_info_container .meta .order_metas li+li
	{
	margin-top: .25rem
}

.coupon_item_container .coupon_item_vertical_2 .coupon_info_container .meta .order_metas li span
	{
	color: #ff7867
}

.coupon_item_container .coupon_item_vertical_2 .applicable_courses {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	padding: 0 0 .5rem;
	font-size: 14px;
	font-weight: 700;
	text-align: center;
	cursor: pointer
}

.coupon_item_container .coupon_item_vertical_2:after,
	.coupon_item_container .coupon_item_vertical_2:before {
	content: "";
	position: absolute;
	width: .6rem;
	height: .6rem;
	border: 2px solid #dedede;
	border-radius: 999999px;
	top: 30px;
	background: #fff;
	z-index: 1
}

.coupon_item_container .coupon_item_vertical_2:before {
	left: -.3rem
}

.coupon_item_container .coupon_item_vertical_2:after {
	right: -.3rem
}

.coupon_item_container.this_coupon_cant_be_used:after {
	content: "유효기간 만료";
	position: absolute;
	top: 0;
	left: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 1.125rem;
	font-weight: 700;
	width: 100%;
	height: 100%;
	border: none;
	background: hsla(0, 0%, 100%, .4);
	border-radius: 0
}

.modal .coupon_list_modal.modal-card {
	top: 0;
	bottom: 0;
	max-width: 1000px;
	height: 90%;
	background-color: #fff;
	border-radius: 3px;
	overflow-y: auto
}

.modal .coupon_list_modal.modal-card .modal-card-head {
	padding-bottom: 1rem;
	box-shadow: 0 2px 8px 0 rgba(0, 0, 0, .2);
	background-color: #fff;
	z-index: 1
}

.modal .coupon_list_modal.modal-card .modal-card-head .title_container {
	width: 100%;
	text-align: center;
	font-size: 1.125rem;
	font-weight: 700
}

.modal .coupon_list_modal.modal-card .modal-card-head .x_btn {
	position: absolute;
	top: 1.25rem;
	right: 1.25rem
}

.modal .coupon_list_modal.modal-card .modal-card-head .x_btn i {
	font-size: 1.6rem;
	color: #b9b9b9
}

.modal .coupon_list_modal.modal-card .modal-card-head .back_btn {
	position: absolute;
	top: 1.25rem;
	left: 1.25rem
}

.modal .coupon_list_modal.modal-card .modal-card-head .back_btn i {
	font-size: 1.6rem;
	color: #b9b9b9
}

.modal .coupon_list_modal.modal-card .modal-card-body {
	position: relative
}

.modal .coupon_list_modal.modal-card .modal-card-body hr {
	background-color: #dedede;
	height: 1px
}

.modal .coupon_list_modal.modal-card .modal-card-body .step_1 {
	transition: transform .75s ease
}

.modal .coupon_list_modal.modal-card .modal-card-body .step_1 .empty_coupons_list
	{
	width: 100%;
	text-align: center;
	color: #cfcfcf
}

.modal .coupon_list_modal.modal-card .modal-card-body .step_1 .empty_coupons_list i
	{
	margin-right: .75rem
}

.modal .coupon_list_modal.modal-card .modal-card-body .step_1.moved {
	transform: translateX(-200%)
}

.modal .coupon_list_modal.modal-card .modal-card-body .step_2 {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	padding: 1rem;
	min-height: 300px;
	transition: transform .75s ease;
	transform: translateX(200%)
}

.modal .coupon_list_modal.modal-card .modal-card-body .step_2.moved {
	transition: transform .75s ease;
	transform: translateX(0)
}

.columns.courses_card_list_body .courses_card_no_result {
	height: 350px;
	display: inline-flex;
	flex-direction: column;
	justify-content: center;
	align-items: center
}

.columns.courses_card_list_body .courses_card_no_result h3 {
	font-size: 3rem;
	font-weight: 700;
	color: #787878
}

.columns.courses_card_list_body .courses_card_no_result p {
	font-size: 1.5rem;
	font-weight: 400;
	color: #5f5f5f
}

@media screen and (max-width:768px) {
	.columns.courses_card_list_body .courses_card_no_result h3 {
		font-size: 1.3rem;
		font-weight: 700;
		color: #787878
	}
	.columns.courses_card_list_body .courses_card_no_result p {
		font-size: .85rem;
		font-weight: 400;
		color: #5f5f5f
	}
}

.course.card {
	height: 100%
}

.course.card .course_card_front .card-content {
	padding: .75rem
}

.course.card .course_card_front .course_card_ribbon {
	position: absolute;
	padding: .25rem;
	top: 5%;
	right: 0;
	color: #fff;
	background: #ff6318;
	font-weight: 700;
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
	border: 1px solid #fff;
	border-right: none
}

@media screen and (max-width:768px) {
	.course.card .course_card_front .course_card_ribbon {
		font-size: .75rem
	}
}

body.is_group_user .course.card .course_card_front .course_card_ribbon {
	display: none
}

.course.card .course_card_front .course_title {
	margin-bottom: 3.75rem;
	font-size: 16px;
	font-weight: 700;
	word-break: break-word
}

.course.card .course_card_front .course_meta {
	position: absolute;
	bottom: .5rem;
	width: calc(100% - 1.5rem)
}

.course.card .course_card_front .course_meta>div {
	padding: 0
}

.course.card .course_card_front .course_meta .rating {
	position: relative
}

.course.card .course_card_front .course_meta .rating .rating_star {
	position: relative;
	width: 4.5rem;
	display: inline-block
}

.course.card .course_card_front .course_meta .rating .rating_star .star_solid
	{
	position: absolute;
	display: inline;
	top: 0;
	left: 0;
	overflow: hidden;
	white-space: nowrap
}

.course.card .course_card_front .course_meta .rating .rating_star svg {
	color: #fdcc11;
	width: .9rem;
	height: .9rem
}

@media screen and (max-width:768px) {
	.course.card .course_card_front .course_meta .rating .rating_star {
		width: 3.6rem
	}
	.course.card .course_card_front .course_meta .rating .rating_star svg {
		width: .72rem
	}
}

.course.card .course_card_front .course_meta .rating .rating_star {
	position: absolute;
	bottom: 0
}

.course.card .course_card_front .course_meta .rating span.review_cnt {
	font-size: .5rem;
	position: absolute;
	left: 4.5rem;
	bottom: .3rem;
	color: #4a4a4a
}

@media screen and (max-width:768px) {
	.course.card .course_card_front .course_meta .rating span.review_cnt {
		display: none
	}
}

.course.card .course_card_front .course_meta .price {
	font-weight: 700;
	color: #175cbe
}

.course.card .course_card_front .course_meta .price del {
	color: #595959;
	font-weight: 500;
	font-size: .9rem;
	opacity: .75
}

body.is_group_user .course.card .course_card_front .course_meta .price del
	{
	color: inherit;
	font-weight: inherit;
	font-size: inherit;
	opacity: inherit;
	text-decoration: initial
}

body.is_group_user .course.card .course_card_front .course_meta .price .pay_price
	{
	display: none
}

.course.card .course_card_front .course_meta .student_num {
	color: #595959
}

.course.card .course_card_front .course_meta .instructor {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

.course.card .course_card_back {
	display: none;
	position: absolute;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, .8);
	color: #fff;
	font-size: 13px;
	padding: 8px
}

.course.card .course_card_back>a {
	position: absolute;
	padding: .75rem;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	color: #fff
}

.course.card .course_card_back p.course_decription {
	line-height: 1.6em;
	font-size: .85rem;
	margin-bottom: .5rem;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 7;
	-webkit-box-orient: vertical;
	word-wrap: break-word
}

.course.card .course_card_back .back_course_metas {
	width: 100%;
	color: #c5ebf8
}

.course.card .course_card_back .back_course_metas>div {
	width: 100%;
	margin-bottom: .07rem
}

.course.card .course_card_back .back_course_metas>div:not (.course_skills
	){
	overflow: hidden;
	height: 1.2rem;
	text-overflow: ellipsis;
	white-space: nowrap
}

.course.card .course_card_back .back_course_metas>div span {
	word-break: break-all;
	text-overflow: ellipsis
}

.course.card .course_card_back .back_course_metas>div span svg {
	margin-right: .2rem;
	vertical-align: sub
}

.course.card .course_card_back .back_course_metas>div span svg.fa-signal-alt
	{
	margin-right: .3rem
}

.course.card .course_card_back .course_card_control {
	position: absolute;
	right: 0;
	bottom: 0;
	text-align: center;
	padding-right: .15rem;
	padding-bottom: .5rem
}

.course.card .course_card_back .course_card_control div {
	padding: .15rem
}

.course.card .course_card_back .course_card_control div i.fa-cart-plus {
	margin-right: .15rem
}

.course.card .course_card_back .course_card_control div i.fa-heart.fas {
	color: #ff6c5c
}

.course.card .course_card_back .course_card_control div i.fa-cart-plus.fas
	{
	color: #fdcc11
}

.course.card .course_card_back .course_card_control div:hover i.fa-cart-plus
	{
	color: #c5ebf8
}

.course.card .course_card_back .course_card_control div:hover i.fa-heart
	{
	color: #ff6c5c
}

@media screen and (min-width:767px) {
	.course.card:hover>.course_card_back {
		display: block
	}
}

@media screen and (max-width:768px) {
	.course.card .card-content {
		padding: .5rem
	}
	.course.card .card-content .course_title {
		font-size: 16px;
		font-weight: 600
	}
	.course.card .course_meta>div {
		font-size: 14px
	}
}

.course.card.my_course .course_title {
	font-weight: 500;
	margin-bottom: 3.5rem
}

.course.card.my_course .inf_progress {
	width: 100%
}

.course.card.my_course .inf_progress label {
	display: none
}

.course.card.my_course span.prgress {
	color: #454545;
	opacity: .6;
	font-size: .75rem
}

.course.card.my_course .dashboard_button_container {
	position: absolute;
	bottom: 2.5rem;
	right: .5rem
}

.course.card.my_course .dashboard_button_container .button.is-link {
	padding: .125rem .25rem;
	height: inherit
}

.course.card.my_course .dashboard_button_container .button.is-link i {
	margin-right: .125rem
}

.course.card.my_course .archive_icon_container {
	position: absolute;
	bottom: .5rem;
	right: .5rem
}

.course.card.my_course .archive_icon_container i {
	opacity: .25
}

.course.card.my_course .archive_icon_container:hover i {
	opacity: .75
}

.course_card .shade {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	left: 0;
	background: rgba(0, 0, 0, .8);
	z-index: 70;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	color: #fff
}

.course_card .shade p {
	font-size: 1rem;
	margin-top: 36px
}

.course_card .shade i {
	font-size: 4rem
}

.box.course_horizon_item {
	height: 100%
}

.box.course_horizon_item .image.is_thumbnail {
	width: 8rem
}

.box.course_horizon_item .content_container {
	width: 100%;
	display: flex
}

.box.course_horizon_item .content_container .course_info .course_title {
	font-weight: 700;
	font-size: 1.125rem
}

.box.course_horizon_item .content_container .course_info .tags {
	margin: .25rem 0
}

.box.course_horizon_item .content_container .course_info .tags .tag {
	font-size: .5rem
}

.box.course_horizon_item .content_container .course_info .rating {
	position: relative
}

.box.course_horizon_item .content_container .course_info .rating span {
	position: absolute;
	top: .25rem;
	font-size: .5rem
}

.box.course_horizon_item .content_container .course_info .rating span.student_cnt
	{
	margin-left: 1rem
}

.box.course_horizon_item .content_container .course_price {
	margin-left: auto;
	text-align: center;
	min-width: 6.5rem
}

.box.course_horizon_item .content_container .course_price .product_amount
	{
	font-size: 1.125rem;
	font-weight: 700
}

.box.course_horizon_item .content_container .course_price .product_amount del
	{
	opacity: .7;
	font-size: .875rem;
	font-weight: inherit
}

.box.course_horizon_item .content_container .course_price .cart_btn_container
	{
	margin-top: .25rem;
	text-align: right
}

.box.course_horizon_item .content_container .course_price .cart_btn_container .course_card_control>div
	{
	-webkit-appearance: none;
	align-items: center;
	border: 1px solid #dbdbdb;
	border-radius: 4px;
	box-shadow: none;
	display: inline-flex;
	font-size: 1rem;
	height: 2.25em;
	line-height: 1.5;
	position: relative;
	vertical-align: top;
	color: #363636;
	cursor: pointer;
	justify-content: center;
	padding: calc(.375em - 1px) .75em;
	text-align: center;
	white-space: nowrap;
	margin-bottom: .125rem
}

.box.course_horizon_item .content_container .course_price .cart_btn_container .course_card_control>div i.fa-heart
	{
	color: #ff6c5c
}

.box.course_horizon_item .content_container .course_price .cart_btn_container .course_card_control>div i.fa-cart-plus
	{
	color: #fda011
}

@media screen and (max-width:768px) {
	.box.course_horizon_item {
		padding: .5rem
	}
	.box.course_horizon_item .media-left {
		margin-right: .5rem
	}
	.box.course_horizon_item .media-left .image.is_thumbnail {
		width: 4rem;
		margin-top: .5rem
	}
	.box.course_horizon_item .content_container .course_info {
		padding-right: .25rem
	}
	.box.course_horizon_item .content_container .course_info .course_title {
		font-size: .85rem
	}
	.box.course_horizon_item .content_container .course_price {
		margin-left: auto;
		text-align: center;
		max-width: 6rem;
		min-width: 4.6rem
	}
	.box.course_horizon_item .content_container .course_price .product_amount
		{
		font-size: 1rem;
		font-weight: 700;
		text-align: right;
		padding-right: .125rem
	}
	.box.course_horizon_item .content_container .course_price .product_amount del
		{
		opacity: .7;
		font-size: .875rem;
		font-weight: inherit
	}
	.box.course_horizon_item .content_container .course_price .cart_btn_container
		{
		margin-top: .25rem;
		text-align: right
	}
	.box.course_horizon_item .content_container .course_price .cart_btn_container .course_card_control>div
		{
		width: 4.5rem
	}
	.box.course_horizon_item .content_container .course_price .cart_btn_container .course_card_control>div+div
		{
		margin-top: .125rem
	}
	.box.course_horizon_item .content_container .course_price .cart_btn_container .course_card_control>div i
		{
		font-size: .875rem
	}
}

.modal .editor_modal {
	background: #fff;
	max-width: 800px
}

.modal .editor_modal.full_modal {
	height: 90vh
}

.modal .editor_modal.full_modal .textarea_container textarea {
	height: 70vh
}

.modal section.modal-card {
	top: 0;
	bottom: 0;
	height: 95%;
	max-width: 920px;
	max-height: 720px;
	z-index: 80
}

.modal section.modal-card .modal-card-head:not (.modal-card-head ){
	padding-bottom: 0;
	border-bottom: none
}

.modal section.modal-card .modal-card-head .title:not (:last-child ){
	margin-bottom: 0
}

.modal section.modal-card .modal-card-body {
	height: 100%
}

.modal section.modal-card .modal-card-body .ql-toolbar.ql-snow {
	margin-top: 0
}

.modal section.modal-card .modal-card-body .ql-container {
	height: calc(100% - 48px)
}
/
*
!
</style>
<body>

</body>
</html>