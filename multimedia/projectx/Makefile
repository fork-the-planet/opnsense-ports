PORTNAME=	projectx
PORTVERSION=	0.91.0
PORTREVISION=	1
CATEGORIES=	multimedia education java
MASTER_SITES=	SF/project-x/project-x/ProjectX_${PORTVERSION}.00
DISTNAME=	ProjectX_${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	DVB (mpeg) cutting/demux tool
WWW=		https://sourceforge.net/projects/project-x/

LICENSE=	GPLv2+
LICENSE_FILE=	${WRKSRC}/Copying

DEPRECATED=	Abandonware, last release in 2011 and dependens on legacy version of Java. Consider using multimedia/ffmpeg or multimedia/vlc
EXPIRATION_DATE=2025-03-31

USES=		java zip:infozip

SUB_FILES=	project-x.sh
DATADIR=	${JAVASHAREDIR}/${PORTNAME}
WRKSRC=		${WRKDIR}/Project-X_${PORTVERSION}
EXTRACT_BEFORE_ARGS+=	-aq

do-configure:
	${SED} -e "s|^javac|${JAVAC}|" ${WRKSRC}/build.sh >${WRKSRC}/build-fbsd.sh

do-build:
	cd ${WRKSRC} && ${MKDIR} build && ${SH} build-fbsd.sh

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}/lib
	${INSTALL_DATA} ${WRKSRC}/ProjectX.jar \
		${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/lib/commons-net-1.3.0.jar \
		${STAGEDIR}${DATADIR}/lib
	${INSTALL_DATA} ${WRKSRC}/lib/jakarta-oro-2.0.8.jar \
		${STAGEDIR}${DATADIR}/lib
	${MKDIR} ${STAGEDIR}${DATADIR}/htmls/images \
		${STAGEDIR}${DATADIR}/htmls/de
	${INSTALL_DATA} ${WRKSRC}/*.txt \
		${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/htmls/*.html \
		${STAGEDIR}${DATADIR}/htmls
	${INSTALL_DATA} ${WRKSRC}/htmls/de/*.html \
		${STAGEDIR}${DATADIR}/htmls/de
	${INSTALL_DATA} ${WRKSRC}/htmls/images/* \
		${STAGEDIR}${DATADIR}/htmls/images
	${INSTALL_SCRIPT} ${WRKDIR}/project-x.sh \
		${STAGEDIR}${PREFIX}/bin/project-x

.include <bsd.port.mk>
