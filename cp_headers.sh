CLEAN_HEADER=bionic/libc/kernel/tools/clean_header.py

KERNEL_PATH=kernel/sony/msm-5.15
HEADER_SRC=$KERNEL_PATH/kernel/include
HEADER_ORI=$KERNEL_PATH/common-headers/original-kernel-headers
HEADER_SAN=$KERNEL_PATH/common-headers/kernel-headers

LINUX_HEADERS="\
    linux/hdmi.h"

UAPI_HEADERS="\
    scsi/ufs/ufs.h\
    scsi/ufs/ioctl.h\
    sound/compress_params.h\
    sound/compress_offload.h\
    sound/asound.h\
    linux/ion.h\
    linux/msm_ion.h\
    linux/msm_ion_ids.h\
    linux/v4l2-mediabus.h\
    linux/esoc_ctrl.h\
    linux/msm_rmnet.h\
    linux/msm_ipa.h\
    linux/videodev2.h\
    linux/fb.h\
    linux/fuse.h\
    linux/ipa_qmi_service_v01.h\
    linux/netlink.h\
    linux/rmnet_data.h\
    linux/rmnet_ipa_fd_ioctl.h\
    linux/socket.h\
    linux/qseecom.h\
    linux/spcom.h\
    linux/v4l2-common.h\
    linux/v4l2-controls.h\
    linux/v4l2-mediabus.h\
    linux/mmc/ioctl.h\
    drm/msm_drm.h\
    drm/drm_fourcc.h\
    drm/drm.h\
    drm/drm_mode.h\
    asm-generic/ioctls.h"

TECHPACK_AUDIO_UAPI_HEADERS="\
    sound/audio_compressed_formats.h\
    sound/audio_effects.h\
    sound/lsm_params.h\
    sound/devdep_params.h\
    sound/msmcal-hwdep.h\
    sound/voice_params.h\
    sound/wcd-dsp-glink.h\
    linux/msm_audio_calibration.h\
    linux/msm_audio_wmapro.h\
    linux/msm_audio_amrwb.h\
    linux/msm_audio_amrwbplus.h\
    linux/msm_audio_wma.h\
    linux/msm_audio_aac.h\
    linux/msm_audio.h"

TECHPACK_AUDIO_PACK_UAPI_HEADERS="\
    wcd9xxx_registers.h"

TECHPACK_CAMERA_UAPI_HEADERS="\
    media/cam_cre.h\
    media/cam_cpas.h\
    media/cam_custom.h\
    media/cam_defs.h\
    media/cam_fd.h\
    media/cam_icp.h\
    media/cam_isp.h\
    media/cam_isp_ife.h\
    media/cam_isp_tfe.h\
    media/cam_isp_vfe.h\
    media/cam_jpeg.h\
    media/cam_lrme.h\
    media/cam_ope.h\
    media/cam_req_mgr.h\
    media/cam_sensor.h\
    media/cam_sync.h\
    media/cam_tfe.h\
    media/cam_defs.h\
    media/cam_sensor.h\
    media/cam_isp.h\
    media/cam_isp_ife.h\
    media/cam_isp_sfe.h\
    media/cam_isp_vfe.h\
    media/cam_icp.h\
    media/cam_cpas.h\
    media/cam_fd.h\
    media/cam_jpeg.h\
    media/cam_lrme.h\
    media/cam_req_mgr.h\
    media/cam_sync.h"

TECHPACK_DISPLAY_UAPI_HEADERS="\
    display/media/msm_sde_rotator.h\
    display/media/mmm_color_fmt.h\
    display/drm/msm_drm_pp.h\
    display/drm/sde_drm.h"

TECHPACK_GRAPHICS_UAPI_HEADERS="\
    linux/msm_kgsl.h"

TECHPACK_SECUREMSM_UAPI_HEADERS="\
    linux/smcinvoke.h"

TECHPACK_VIDEO_UAPI_HEADERS="\
    msm_media_info.h"

HEADER_OVERRIDES="\
    linux/socket.h\
    media/msm_media_info.h\
    display/media/mmm_color_fmt.h"

cd ../../../..

source build/envsetup.sh
lunch 50

for x in $LINUX_HEADERS; do \
cp $HEADER_SRC/$x $HEADER_ORI/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI -d $HEADER_SAN $x &>out/cp_headers_5.15.log
done

for x in $UAPI_HEADERS; do \
cp $HEADER_SRC/"uapi/"$x $HEADER_ORI/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI -d $HEADER_SAN $x &>>out/cp_headers_5.15.log
done

for x in $TECHPACK_AUDIO_UAPI_HEADERS; do \
cp $HEADER_SRC/"../techpack/audio/include/uapi/audio/"$x $HEADER_ORI/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI -d $HEADER_SAN $x &>>out/cp_headers_5.15.log
done

for x in $TECHPACK_AUDIO_PACK_UAPI_HEADERS; do \
cp $HEADER_SRC/"../techpack/audio/include/asoc/"$x $HEADER_ORI/audio/linux/mfd/wcd9xxx/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI -d $HEADER_SAN $x &>>out/cp_headers_5.15.log
done

for x in $TECHPACK_CAMERA_UAPI_HEADERS; do \
cp $HEADER_SRC/"../techpack/camera/include/uapi/camera/"$x $HEADER_ORI/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI -d $HEADER_SAN $x &>>out/cp_headers_5.15.log
done

for x in $TECHPACK_DISPLAY_UAPI_HEADERS; do \
cp $HEADER_SRC/"../techpack/display/include/uapi/"$x $HEADER_ORI/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI -d $HEADER_SAN $x &>>out/cp_headers_5.15.log
done

for x in $TECHPACK_GRAPHICS_UAPI_HEADERS; do \
cp $HEADER_SRC/"../techpack/graphics/include/uapi/"$x $HEADER_ORI/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI -d $HEADER_SAN $x &>>out/cp_headers_5.15.log
done

for x in $TECHPACK_SECUREMSM_UAPI_HEADERS; do \
cp $HEADER_SRC/"../techpack/securemsm/"$x $HEADER_ORI/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI -d $HEADER_SAN $x &>>out/cp_headers_5.15.log
done

for x in $TECHPACK_VIDEO_UAPI_HEADERS; do \
cp $HEADER_SRC/"../techpack/video/driver/vidc/inc/"$x $HEADER_ORI/media/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI -d $HEADER_SAN $x &>>out/cp_headers_5.15.log
done

for x in $HEADER_OVERRIDES; do \
cp $HEADER_ORI/$x $HEADER_SAN/$x
done

echo "Copy complete!"
