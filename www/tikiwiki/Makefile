PORTNAME=	tikiwiki
DISTVERSION=	28.4
CATEGORIES=	www
MASTER_SITES=	SF/${PORTNAME}/Tiki_28.x_Castor/${DISTVERSION}/
DISTNAME=	tiki-${DISTVERSION}

MAINTAINER=	wen@FreeBSD.org
COMMENT=	Powerful PHP based Wiki/CMS/Groupware
WWW=		https://tiki.org/

LICENSE=	LGPL21
LICENSE_FILE=	${WRKSRC}/license.txt

USES=		php:web
USE_PHP=	calendar dom fileinfo gd gettext intl mbstring mcrypt \
		posix session xml zip zlib

NO_BUILD=	yes
NO_MTREE=	yes
NO_ARCH=	yes
TIKIWIKI_DIR?=	www/${PORTNAME}-${DISTVERSION}
SUB_FILES=	pkg-message
SUB_LIST+=	TIKIWIKI_DIR=${TIKIWIKI_DIR}

WRI_DIR=	db dump img/trackers img/wiki img/wiki_up modules/cache \
		temp temp/templates_c temp/cache templates_c templates whelp

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/${TIKIWIKI_DIR}
	(cd ${WRKSRC} && \
		${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/${TIKIWIKI_DIR})

# pkg-plist would be over 15,000 lines, consuming 1.1Mb
# The benefits of a fixed pkg-plist aren't worth it, autogen!

post-install:
	@(cd ${STAGEDIR}${PREFIX}; ${FIND} * \( -type f -or -type l \) | \
		${SORT} | ${SED} -e 's/^/@(${WWWOWN},${WWWGRP},) /' >> ${TMPPLIST})
	@(cd ${STAGEDIR}${PREFIX}; ${FIND} * -type d -empty | \
		${SORT} -r | ${SED} -e 's/^/@dir /' >> ${TMPPLIST})

	@${ECHO_CMD} "@mode 777" >> ${TMPPLIST}
.for i in ${WRI_DIR} do
	@${MKDIR} ${STAGEDIR}${PREFIX}/${TIKIWIKI_DIR}/${i}
	@${ECHO_CMD} "@dir ${TIKIWIKI_DIR}/${i}" >> ${TMPPLIST}
.endfor
	@${ECHO_CMD} "@mode" >> ${TMPPLIST}

.include <bsd.port.mk>
