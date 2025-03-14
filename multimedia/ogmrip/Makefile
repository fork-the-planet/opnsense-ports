PORTNAME=	ogmrip
PORTVERSION=	1.0.1
PORTREVISION=	17
CATEGORIES=	multimedia
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION:R}/${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Application and libraries for encoding DVDs into DivX/OGM files
WWW=		https://ogmrip.sourceforge.net/

LICENSE=	GPLv2+  # from source, though COPYING says LGPLv2

DEPRECATED=	Abandonware, last activity in 2018 and lacks support for new formats. Consider using multimedia/handbrake
EXPIRATION_DATE=2025-03-31

BUILD_DEPENDS=	mencoder:multimedia/mencoder \
		mplayer:multimedia/mplayer \
		gsed:textproc/gsed
LIB_DEPENDS=	libenca.so:converters/enca \
		libpng.so:graphics/png \
		libtiff.so:graphics/tiff \
		libdvdread.so:multimedia/libdvdread
RUN_DEPENDS=	lame:audio/lame \
		oggenc:audio/vorbis-tools \
		mencoder:multimedia/mencoder \
		mplayer:multimedia/mplayer \
		ogmmerge:multimedia/ogmtools

USES=		desktop-file-utils gmake gnome libtool localbase:ldflags \
		pathfix pkgconfig
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--disable-gtk-support --disable-dbus-support \
		--disable-libnotify-support
USE_GNOME=	glib20 intlhack libxml2
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	ENCHANT MATROSKA NLS THEORA FAAC SRT DEBUG
OPTIONS_SUB=	yes
ENCHANT_DESC=	Enable spell checking for text subtitles
MATROSKA_DESC=	Enable Matroska container support
THEORA_DESC=	Enable Ogg Theora video codec support
SRT_DESC=	Enable SRT text subtitles support

ENCHANT_CONFIGURE_ENABLE=enchant-support
ENCHANT_LIB_DEPENDS=	libenchant.so:textproc/enchant

MATROSKA_CONFIGURE_ENABLE=mkv-support
MATROSKA_RUN_DEPENDS=	mkvmerge:multimedia/mkvtoolnix

NLS_USES=		gettext
NLS_CONFIGURE_ENABLE=	nls

THEORA_CONFIGURE_ENABLE=theora-support
THEORA_LIB_DEPENDS=	libtheora.so:multimedia/libtheora

FAAC_CONFIGURE_ENABLE=	aac-support
FAAC_RUN_DEPENDS=	faac:audio/faac

SRT_CONFIGURE_ENABLE=	srt-support
SRT_RUN_DEPENDS=	gocr:graphics/gocr

DEBUG_CONFIGURE_ON=	--enable-maintainer-mode --enable-devel-mode

pre-everything::
	@${ECHO_MSG} ""
	@${ECHO_MSG} "This port requires a version of MEncoder compiled with XviD and/or"
	@${ECHO_MSG} "x264 support if you want to use these codecs."
	@${ECHO_MSG} ""

post-patch:
	@${REINPLACE_CMD} -e '/local/s|^CFLAGS=|#CFLAGS=|g ; \
		 /local/s|^CPPFLAGS=|#CPPFLAGS=|g ; \
		 /local/s|^LDFLAGS=|#LDFLAGS=|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|^SUBDIRS|#SUBDIRS|g' ${WRKSRC}/docs/Makefile.in
	@${REINPLACE_CMD} -e \
		'/PROGRAM/s|MP4Box|mp4box|g' ${WRKSRC}/libogmrip/ogmrip-mp4.c

.include <bsd.port.mk>
