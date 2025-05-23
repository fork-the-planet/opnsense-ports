PORTNAME=	muttprint
PORTVERSION=	0.73
PORTREVISION=	7
CATEGORIES=	print mail
MASTER_SITES=	SF/muttprint/muttprint/muttprint-${PORTVERSION}

MAINTAINER=	guru@unixarea.de
COMMENT=	Utility to print mail for most any mail client
WWW=		https://muttprint.sourceforge.net/

LICENSE=	GPLv2

DEPRECATED=	Depends on expired textproc-docbook-utils
EXPIRATION_DATE=2025-06-21

BUILD_DEPENDS=	docbook2pdf:textproc/docbook-utils \
		docbook-sgml>0:textproc/docbook-sgml
RUN_DEPENDS=	psnup:print/psutils \
		p5-TimeDate>=0:devel/p5-TimeDate \
		p5-Text-Iconv>=0:converters/p5-Text-Iconv

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
USES=		autoreconf gmake perl5 tex
USE_TEX=	latex dvipsk

NO_BUILD=	yes
REINPLACE_ARGS=	-i ""

OPTIONS_DEFINE=		CUPS X11 DOCS XFACE
OPTIONS_DEFAULT=	X11
X11_DESC=		graphics/ImageMagick[-nox11] dependency
XFACE_DESC=		mail/faces dependency (requires gtk12)

CUPS_RUN_DEPENDS=	lpr-cups:print/cups
XFACE_RUN_DEPENDS=	uncompface:mail/faces

.if !defined(PAPERSIZE)
PAPERSIZE=	letter
.endif

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MCUPS}
PRINT_COMMAND=CUPS
.else
PRINT_COMMAND=lpr -P$$PRINTER
.endif

.if ${PORT_OPTIONS:MX11}
USES+=		magick:6,run
.else
USES+=		magick:6,run,nox11
.endif

pre-everything::
	@${ECHO}
	@${ECHO} Set PAPERSIZE=a4 if you need that paper size.
	@${ECHO}

post-patch:
	@${RM} ${WRKSRC}/pics/*.orig
.if ${PAPERSIZE}==a4
	@${REINPLACE_CMD} 's|%%PAPERSIZE%%|${PAPERSIZE:tu}|' \
		${WRKSRC}/muttprint
.else
	@${REINPLACE_CMD} 's|%%PAPERSIZE%%|${PAPERSIZE}|' \
		${WRKSRC}/muttprint
.endif
	@${REINPLACE_CMD} 's|%%PRINT_COMMAND%%|${PRINT_COMMAND}| ; \
		s|%%PREFIX%%|${PREFIX}|' \
		${WRKSRC}/muttprint
.if ${PORT_OPTIONS:MCUPS}
	@${REINPLACE_CMD} 's|lpr $$CUPS_OPTIONS|${PREFIX}/bin/lpr $$CUPS_OPTIONS|' ${WRKSRC}/muttprint
.endif

.include <bsd.port.mk>
