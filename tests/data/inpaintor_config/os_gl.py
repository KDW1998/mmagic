model = dict(
    type='OneStageInpaintor',
    encdec=dict(
        type='GLEncoderDecoder',
        encoder=dict(type='GLEncoder'),
        decoder=dict(type='GLDecoder'),
        dilation_neck=dict(type='GLDilationNeck')),
    disc=dict(
        type='MultiLayerDiscriminator',
        in_channels=3,
        max_channels=512,
        fc_in_channels=512 * 4 * 4,
        fc_out_channels=1024,
        num_convs=6,
        norm_cfg=dict(type='BN'),
    ),
    loss_gan=dict(
        type='GANLoss',
        gan_type='vanilla',
        loss_weight=0.001,
    ),
    loss_gp=dict(
        type='GradientPenaltyLoss',
        loss_weight=1.,
    ),
    loss_disc_shift=None,
    loss_composed_percep=dict(
        type='PerceptualLoss',
        layer_weights={'0': 1.},
        perceptual_weight=0.1,
        style_weight=0,
    ),
    loss_l1_hole=None,
    loss_l1_valid=None,
    loss_tv=None,
    pretrained=None)

train_cfg = dict(disc_step=1)
test_cfg = dict(test=1)