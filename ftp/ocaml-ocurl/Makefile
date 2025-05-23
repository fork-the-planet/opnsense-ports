PORTNAME=	ocurl
PORTVERSION=	0.9.2
PORTREVISION=	5
CATEGORIES=	ftp
PKGNAMEPREFIX=	ocaml-

MAINTAINER=	danfe@FreeBSD.org
COMMENT=	Interface for OCaml to the curl lib
WWW=		https://ygrek.org/p/ocurl/

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	ocamlc:lang/ocaml \
		ocamlfind:devel/ocaml-findlib
RUN_DEPENDS:=	${BUILD_DEPENDS}
LIB_DEPENDS=	libcurl.so:ftp/curl

USES=		gmake ocaml:camlp4,findlib,ldconfig

GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	ygrek

OCAML_PKGDIRS=		curl

OPTIONS_DEFINE=		LWT
OPTIONS_DEFAULT=	LWT
OPTIONS_SUB=		yes
LWT_DESC=		Include threading support (ocaml-lwt)
LWT_RUN_DEPENDS=	${LOCALBASE}/${OCAML_SITELIBDIR}/lwt/lwt.a:devel/ocaml-lwt
LWT_BUILD_DEPENDS=	${LWT_RUN_DEPENDS}

post-install-LWT-on:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${OCAML_SITELIBDIR}/curl/curl_lwt.cmxs

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${OCAML_SITELIBDIR}/curl/dllcurl-helper.so \
		${STAGEDIR}${PREFIX}/${OCAML_SITELIBDIR}/curl/curl.cmxs \

post-configure-LWT-off:
# Override auto-detection
	${REINPLACE_CMD} 's/(lwt,no)/(no,no)/' ${WRKSRC}/Makefile \
		${WRKSRC}/examples/Makefile

.include <bsd.port.mk>
