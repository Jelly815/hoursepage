<?php
	$tpl=new TemplatePower(_TLOGIN);
	$tpl->prepare();
	$tpl->assign(array('CSSPATH'=>CSSPATH,'TITLELOGIN'=>LOGIN,'EMAIL'=>EMAIL,'EMAILTXT'=>EMAILTXT,'PWD'=>PWD,'error'=>$error,'LOGINBTN'=>LOGINBTN,'SIGNBTN'=>SIGNBTN,'LOGIN'=>LOGIN,'LOGINPATH'=>LOGINPATH,'TITLESIGN'=>TITLESIGN,'SIGNPATH'=>SIGNPATH,'HEADERTITLE'=>HEADERTITLE,'INDEXPATH'=>INDEXPATH));
	$tpl->printToScreen();
?>