PORTNAME=	publicfile
PORTVERSION=	0.52
PORTREVISION=	3
CATEGORIES=	www ftp
MASTER_SITES=	http://cr.yp.to/publicfile/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Secure, read-only, anonymous HTTP/FTP server
WWW=		https://cr.yp.to/publicfile.html

# Converted from LEGAL_TEXT
LICENSE=	djb
LICENSE_NAME=	djb
LICENSE_TEXT=	No license -- see http://cr.yp.to/softwarelaw.html
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

DEPRECATED=	Unmaintained for years upstream and in tree, consider using www/darkhttpd , www/miniserve and/or ftp/tnftpd , ftp/unftp 
EXPIRATION_DATE=2025-04-30

RUN_DEPENDS=	setuidgid:sysutils/daemontools \
		tcpserver:sysutils/ucspi-tcp

OPTIONS_DEFINE=	BASICAUTH COMMONLOG REDIRECT_SLASH ENV_FILETYPES SSL
BASICAUTH_DESC=		basic HTTP authentication support
COMMONLOG_DESC=		support for Apache common log format
REDIRECT_SLASH_DESC=	do not require trailing slash on directories
ENV_FILETYPES_DESC=	get mime types from the environment
SSL_DESC=		provide SSL support through ucspi-ssl

CONFLICTS=	xshttpd-3*

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MBASICAUTH} && ${PORT_OPTIONS:MCOMMONLOG}
BROKEN=	common log and auth patches are currently in conflict
.endif

.if ${PORT_OPTIONS:MBASICAUTH} && ${PORT_OPTIONS:MREDIRECT_SLASH}
BROKEN=	redirect slash and auth patches are currently in conflict
.endif

.if ${PORT_OPTIONS:MREDIRECT_SLASH}
pre-configure::
	@${PATCH} -d ${PATCH_WRKSRC} ${PATCH_ARGS} < ${PATCHDIR}/redirect-slash-patch
.endif

.if ${PORT_OPTIONS:MENV_FILETYPES}
pre-configure::
	@${PATCH} -d ${PATCH_WRKSRC} ${PATCH_ARGS} < ${PATCHDIR}/publicfile-0.52-filetype-diff
.endif

.if ${PORT_OPTIONS:MSSL}
pre-configure::
	@${PATCH} -d ${PATCH_WRKSRC} ${PATCH_ARGS} < ${PATCHDIR}/publicfile.sslserver
RUN_DEPENDS+=	sslserver:sysutils/ucspi-ssl
.endif

.if ${PORT_OPTIONS:MBASICAUTH}
pre-configure::
	@${PATCH} -d ${PATCH_WRKSRC} ${PATCH_ARGS} -p1 < \
		${PATCHDIR}/publicfile-0.52_basicauth.patch
PATCH_DEPENDS+=	${NONEXISTENT}:databases/cdb:extract
PLIST_SUB+=	BASICAUTH=""
.else
PLIST_SUB+=	BASICAUTH="@comment "
.endif

.if ${PORT_OPTIONS:MCOMMONLOG}
pre-configure::
	@${PATCH} -d ${PATCH_WRKSRC} ${PATCH_ARGS} -p1 < \
		${PATCHDIR}/publicfile-0.52-commonlog-2.patch
.endif

ALL_TARGET=	it
INSTALL_TARGET=	setup check

post-extract:
.if ${PORT_OPTIONS:MBASICAUTH}
	@${LN} -s $$(${MAKE} -C ${PORTSDIR}/databases/cdb -V WRKSRC) ${WRKSRC}/cdb
.endif

post-patch:
	@${ECHO_CMD} "${CC} ${CFLAGS}" > ${WRKSRC}/conf-cc
	@${ECHO_CMD} "${CC} -s" > ${WRKSRC}/conf-ld
	@${ECHO_CMD} "${PREFIX}" > ${WRKSRC}/conf-home
	@${ECHO_CMD} "${STAGEDIR}${PREFIX}" > ${WRKSRC}/conf-stage
.if ${PORT_OPTIONS:MBASICAUTH}
	@${ECHO_CMD} "${CC} ${CFLAGS}" > ${WRKSRC}/cdb/conf-cc
	@${ECHO_CMD} "${CC} -s" > ${WRKSRC}/cdb/conf-ld
	@${ECHO_CMD} "${PREFIX}" > ${WRKSRC}/cdb/conf-home
.endif

.include <bsd.port.mk>
