PORTNAME=	labltk
PORTVERSION=	8.06.12
PORTREVISION=	1
CATEGORIES=	x11-toolkits
PKGNAMEPREFIX=	ocaml-

MAINTAINER=	danfe@FreeBSD.org
COMMENT=	Objective Caml interface to Tk
WWW=		https://forge.ocamlcore.org/projects/labltk/

LICENSE=	LGPL20

USES=		gmake ocaml:ldconfig tk
USE_GITHUB=	yes
GH_ACCOUNT=	garrigue

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	-tkdefs "-I${LOCALBASE}/include -I${TCL_INCLUDEDIR}\
		-I${TK_INCLUDEDIR}" \
		-tklibs "-L${LOCALBASE}/lib -ltcl${TCL_SHLIB_VER}\
		-ltk${TK_SHLIB_VER}" \
		-installbindir "${STAGEDIR}${PREFIX}/bin" \
		-installdir "${STAGEDIR}${PREFIX}/${OCAML_SITELIBDIR}/${PORTNAME}" \
		-libdir "${PREFIX}/${OCAML_LIBDIR}" \
		-verbose

MAKE_ENV=		RANLIB=/usr/bin/ranlib INSTALLDIR_REL=${OCAML_SITELIBDIR}/${PORTNAME}
MAKE_JOBS_UNSAFE=	yes

ALL_TARGET=	all opt

.include <bsd.port.options.mk>

.if ${ARCH} == powerpc
LLD_UNSAFE=	yes
.endif

post-patch:
	@${REINPLACE_CMD} \
		-e '/exec $$(INSTALLDIR)/s|$$(INSTALLDIR)|$$(PREFIX)/$$(INSTALLDIR_REL)|g' \
		${WRKSRC}/lib/Makefile

post-configure:
	${ECHO_CMD} "STUBLIBDIR=${STAGEDIR}${PREFIX}/${OCAML_SITELIBDIR}/${PORTNAME}" \
		>> ${WRKSRC}/config/Makefile

pre-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/${OCAML_SITELIBDIR}/${PORTNAME}

post-install:
	${INSTALL_DATA} ${WRKSRC}/support/META ${STAGEDIR}${PREFIX}/${OCAML_SITELIBDIR}/${PORTNAME}
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/${OCAML_SITELIBDIR}/${PORTNAME}/dlllabltk.so

.include <bsd.port.mk>
