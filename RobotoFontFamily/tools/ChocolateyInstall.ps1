#Start-ChocolateyProcessAsAdmin @'
	$package = 'RobotoFonts';
	$fontUrl = 'http://developer.android.com/downloads/design/Roboto_Hinted_20120823.zip';
	Install-ChocolateyTrueTypeFonts $package $fontUrl;
	pause;
#'@