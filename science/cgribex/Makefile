PORTNAME=	cgribex
PORTVERSION=	2.0.0
PORTREVISION=	1
CATEGORIES=	science
MASTER_SITES=	https://code.mpimet.mpg.de/attachments/download/26325/ \
		LOCAL/sunpoet

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Lightweight GRIBEX in C with portable Fortran interface
WWW=		https://code.mpimet.mpg.de/projects/cgribex

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool

CPPFLAGS+=	-DgFortran
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	JASPER SZIP
OPTIONS_DEFAULT=JASPER SZIP

JASPER_CONFIGURE_WITH=	jasper=${LOCALBASE}
JASPER_LIB_DEPENDS=	libjasper.so:graphics/jasper
SZIP_CONFIGURE_WITH=	szlib=${LOCALBASE}
SZIP_LIB_DEPENDS=	libsz.so:science/libaec

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libcgribex.so

.include <bsd.port.mk>
