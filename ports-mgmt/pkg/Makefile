PORTNAME=	pkg
DISTVERSION=	1.19.2
PORTREVISION=	5
_PKG_VERSION=	${DISTVERSION}
CATEGORIES=	ports-mgmt

PATCH_SITES=	https://github.com/freebsd/${PORTNAME}/commit/
PATCHFILES=	fc09e75.patch:-p1 69e28e7.patch:-p1

MAINTAINER=	pkg@FreeBSD.org
COMMENT=	Package manager
WWW=		https://github.com/freebsd/pkg

LICENSE=	BSD2CLAUSE

USE_GITHUB=	yes
GH_ACCOUNT=	freebsd

USE_LDCONFIG=	${PREFIX}/lib/compat/pkg
HAS_CONFIGURE=	yes
PORTDOCS=	NEWS
PORTSCOUT=	ignore:1
CONFIGURE_ARGS=	--mandir=${PREFIX}/man --prefix="${PREFIX}"
CONFIGURE_ENV=	CC_FOR_BUILD="${CC}"

# Use a submake as 'deinstall install' needs to reevaluate PKG_REGISTER
# so that pkg-static is used from the wrkdir
USE_SUBMAKE=	yes
CFLAGS+=	-Wno-error
CFLAGS_powerpc64le=	-DSQLITE_BYTEORDER=1234
LDFLAGS+=	-Wl,--undefined-version

OPTIONS_DEFINE=	DOCS

.if !exists(/usr/include/jail.h)
EXTRA_PATCHES=	${FILESDIR}/extra-patch-docs_pkg.8
.endif

.include <bsd.port.pre.mk>

.if defined(WITH_DEBUG)
MAKE_ARGS+=	DEBUG_FLAGS="${DEBUG_FLAGS}"
.endif

.if defined(WITH_PKG)
.if ${WITH_PKG} == devel
IGNORE=	WITH_PKG is defined to 'devel', this version is the stable one
.endif
.if exists(${LOCALBASE}/sbin/pkg_info) || exists(/usr/sbin/pkg_info)
NB_OLDPKGS!=	pkg_info 2>/dev/null | wc -l
.if exists(${PKG_BIN})
NB_NEWPKGS!=	${PKG_INFO} -aq | wc -l
.else
NB_NEWPKGS=	0
.endif
# Only show the pre-everything notice if they have not already
# converted any packages
.if ${NB_OLDPKGS} > 0 && ${NB_NEWPKGS} == 0 && !defined(UPGRADEPKG)

pre-everything::
	@${ECHO_CMD} "You are about to convert your system to pkg while you have ports/packages"; \
	 ${ECHO_CMD} "installed with the old pkg_install tools."; \
	 ${ECHO_CMD} ""; \
	 ${ECHO_CMD} "To switch to pkg:"; \
	 ${ECHO_CMD} "    1) Install ports-mgmt/pkg"; \
	 ${ECHO_CMD} "       cd ports-mgmt/pkg && make UPGRADEPKG=1 install clean"; \
	 ${ECHO_CMD} "    2) Convert your package database by running pkg2ng"; \
	 ${ECHO_CMD} ""; \
	exit 1

.endif
.endif
.endif

#define PKG_DEPENDS to nothing to avoid infinite loop looking for pkg :)
PKG_DEPENDS=
.undef INSTALLS_DEPENDS

# Use the internal pkg instead, generally, unless this is a cross-build,
# in which case that won't work. Hope for the best then.
.if !defined(CROSS_TOOLCHAIN)
PKG_BIN=	${WRKSRC}/src/pkg-static
.endif

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/compat/pkg

post-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/NEWS ${STAGEDIR}${DOCSDIR}/NEWS

.include <bsd.port.post.mk>
