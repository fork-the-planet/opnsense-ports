PORTNAME=	mftrace
DISTVERSION=	1.2.20
PORTREVISION=	1
CATEGORIES=	print
MASTER_SITES=	http://lilypond.org/download/sources/mftrace/ \
		LOCAL/nivit/${PORTNAME}/

MAINTAINER=	nivit@FreeBSD.org
COMMENT=	Scalable PostScript (Type1) Fonts for MetaFont
WWW=		https://lilypond.org/mftrace/

RUN_DEPENDS=	t1asm:print/t1utils \
		fontforge:print/fontforge

.if defined(WITH_AUTOTRACE)
BUILD_DEPENDS+=	autotrace:graphics/autotrace
RUN_DEPENDS+=	autotrace:graphics/autotrace
.else
BUILD_DEPENDS+=	potrace:graphics/potrace
RUN_DEPENDS+=	potrace:graphics/potrace
.endif

USES=		gmake python tex
USE_TEX=	base
GNU_CONFIGURE=	yes
MAKEFILE=	GNUmakefile

PIE_UNSAFE=	yes

PLIST_FILES=	\
		bin/gf2pbm \
		bin/mftrace \
		%%PYTHON_SITELIBDIR%%/afm.py \
		%%PYTHON_SITELIBDIR%%/tfm.py \
		share/man/man1/mftrace.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/gf2pbm ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/mftrace ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/mftrace.1 ${STAGEDIR}${PREFIX}/share/man/man1
	@${MKDIR} ${STAGEDIR}${PYTHON_SITELIBDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/tfm.py ${STAGEDIR}${PYTHON_SITELIBDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/afm.py ${STAGEDIR}${PYTHON_SITELIBDIR}

.include <bsd.port.mk>
