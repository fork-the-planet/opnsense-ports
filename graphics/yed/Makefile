PORTNAME=	yed
DISTVERSION=	3.25
CATEGORIES=	graphics java
MASTER_SITES=	#
DISTNAME=	yEd-${DISTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Editor for graphs and diagrams
WWW=		https://www.yworks.com/products/yed

LICENSE=	YED_1_2
LICENSE_NAME=	yEd Software License Agreement (Version 1.2)
LICENSE_TEXT=	Description of the license can be obtained from the following URL: \
		http://www.yworks.com/products/yed/license.html
# Downloading requires acceptance of license agreement
LICENSE_PERMS=	no-dist-mirror no-dist-sell no-pkg-mirror no-pkg-sell auto-accept

USES=		cpe java zip
JAVA_VERSION=	17+
CPE_VENDOR=	yworks

DESKTOP_ENTRIES="yEd" "${COMMENT}" "" "yed" "Graphics;" false

NO_ARCH=	yes
NO_BUILD=	yes

SUB_FILES=	${PORTNAME}
SUB_LIST=	JAVA_HOME=${JAVA_HOME}

WRKSRC=	${WRKDIR}/${PORTNAME}-${DISTVERSION}

DOWNLOAD_URL?=	http://www.yworks.com/downloads\#yEd

.include <bsd.port.pre.mk>

.if !exists(${DISTDIR}/${DISTNAME}${EXTRACT_SUFX})
IGNORE=	you must manually obtain ${DISTNAME}${EXTRACT_SUFX} from\
	'${DOWNLOAD_URL}', place it in ${DISTDIR} and then run make again
.endif

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/license.html ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/thirdpartylicenses.html ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.jar ${STAGEDIR}${DATADIR}
	@${MKDIR}  ${STAGEDIR}${DATADIR}/lib
.	for lib in common-image.jar \
		common-io.jar \
		common-lang.jar \
		imageio-bmp.jar \
		imageio-core.jar \
		imageio-hdr.jar \
		imageio-icns.jar \
		imageio-iff.jar \
		imageio-jpeg.jar \
		imageio-metadata.jar \
		imageio-pcx.jar \
		imageio-pict.jar \
		imageio-psd.jar \
		imageio-sgi.jar \
		imageio-tga.jar \
		imageio-thumbsdb.jar \
		imageio-tiff.jar \
		imageio-webp.jar \
		vectorgraphics.jar
		${INSTALL_DATA} ${WRKSRC}/lib/${lib} ${STAGEDIR}${DATADIR}/lib
.	endfor

.include <bsd.port.post.mk>
