--- m4/nut_check_libltdl.m4.orig	2025-04-16 17:55:40 UTC
+++ m4/nut_check_libltdl.m4
@@ -10,10 +10,7 @@ if test -z "${nut_have_libltdl_seen}"; then
 	dnl No NUT_CHECK_PKGCONFIG here: (lib)ltdl.pc was not seen on any OS
 
 	dnl save CFLAGS and LIBS
-	CFLAGS_ORIG="${CFLAGS}"
-	LIBS_ORIG="${LIBS}"
 	LIBS=""
-	CFLAGS=""
 	depLIBS=""
 	depCFLAGS=""
 	dnl For fallback below:
@@ -94,7 +91,5 @@ if test -z "${nut_have_libltdl_seen}"; then
 	unset depLIBS
 
 	dnl restore original CFLAGS and LIBS
-	CFLAGS="${CFLAGS_ORIG}"
-	LIBS="${LIBS_ORIG}"
 fi
 ])
