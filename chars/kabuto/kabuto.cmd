;-| ���K�E�Z |------------------------------------------------------
;���C�_�[�L�b�N
[Command]
name = "DFDF_c"     
command =  D, F, D, F, c
time = 50


[Command]
name = "C_UP"     
command =  ~a, a, F, b, c
time = 50

;-| �K�E�Z |------------------------------------------------------

;�A�o�����`���b�V��
[Command]
name = "BF_a"
command = D, F, a
;command = ~20$B, F, a
time = 30

[Command]
name = "BF_aa"
command =  a
time = 30

[Command]
name = "BF_aaa"
command =  a
time = 30

[Command]
name = "BF_aaaa"
command =  a
time = 30

[Command]
name = "BF_aaaab"
command =  b
time = 30

[Command]
name = "BF_aab"
command =  b
time = 30

;�A�o�����`�X���b�V��
[Command]
name = "BF_c"
command = D, F, c
time = 30

[Command]
name = "BF_cc"
command =  c
time = 30

[Command]
name = "BF_ccc"
command =  c
time = 30

;�A�b�p�[�X���b�V��
[Command]
name = "DU_a"
command = D, B, a
time = 15

;�A�b�p�[�X���b�V����
[Command]
name = "DU_c"
command = D, B, c
time = 15

;-| �Q�񉟂��Z |-----------------------------------------------------------
[Command]
name = "FF"     
command = F, F
time = 10

[Command]
name = "BB"     
command = B, B
time = 10

[Command]
name = "DU"
command = D, U
time = 10

;-| �Q�E�R�̓��������Z |-----------------------------------------------
[Command]
name = "recovery"
command = a+b
time = 1

;-| �����ƃ{�^���ŏo���Z |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| �{�^���ݒ�i������Ȃ��j|---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| �������ςȂ��ݒ�i������Ȃ��j-------------------------------------------------------
[Command]
name = "holdfwd"
command = /$F
time = 1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdup" 
command = /$U
time = 1

[Command]
name = "holddown"
command = /$D
time = 1

; ���̋L�q���͐�΂ɏ����Ȃ��ł��������B
[Statedef -1]

;===========================================================================

;---------------------------------------------------------------------------
;
[State -1, clockup]
type = ChangeState
value = 3500
triggerall = command = "C_UP"
triggerall = power >= 3000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (Stateno = 400) && movecontact = 1
;---------------------------------------------------------------------------
;���C�_�[�L�b�N
[State -1, Rider Kick]
type = ChangeState
value = 3000
triggerall = command = "DFDF_c"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact

;---------------------------------------------------------------------------
;�A�o�����`���b�V��1
[State -1, A-Rush]
type = ChangeState
value = 1000
triggerall = command = "BF_a"
trigger1 = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
;---------------------------------------------------------------------------
;�A�o�����`���b�V��2
[State -1, A-Rush]
type = ChangeState
value = 1001
triggerall = (command = "BF_aa" )
triggerall = stateno = 1000
trigger1 = time = [15,25]
trigger2 = movecontact
trigger2 = time <= 25
;---------------------------------------------------------------------------
;�A�o�����`���b�V��3
[State -1, A-Rush]
type = ChangeState
value = 1002
triggerall = (command = "BF_aaa" )
triggerall = stateno = 1001
trigger1 = time = [15,25]
trigger2 = movecontact
trigger2 = time <= 25
;---------------------------------------------------------------------------
;�A�o�����`���b�V��4
[State -1, A-Rush]
type = ChangeState
value = 1003
triggerall = (command = "BF_aaaa" )
triggerall = stateno = 1002
trigger1 = time = [15,25]
trigger2 = movecontact
trigger2 = time <= 25
;---------------------------------------------------------------------------
;�A�o�����`���b�V��5
[State -1, A-Rush]
type = ChangeState
value = 1004
triggerall = (command = "BF_aaaab" )
triggerall = stateno = 1003
trigger1 = time = [15,25]
trigger2 = movecontact
trigger2 = time <= 25
;---------------------------------------------------------------------------
;�A�o�����`���b�V��3'
[State -1, A-Rush]
type = ChangeState
value = 1005
triggerall = (command = "BF_aab" )
triggerall = stateno = 1001
trigger1 = time = [15,25]
trigger2 = movecontact
trigger2 = time <= 25

;---------------------------------------------------------------------------
;�A�o�����`�X���b�V��1
[State -1, A-Slash]
type = ChangeState
value = 1100
triggerall = command = "BF_c"
trigger1 = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
;---------------------------------------------------------------------------
;�A�o�����`���b�V��2
[State -1, A-Slash]
type = ChangeState
value = 1101
triggerall = (command = "BF_cc" )
triggerall = stateno = 1100
trigger1 = time = [15,25]
trigger2 = movecontact
trigger2 = time <= 25
;---------------------------------------------------------------------------
;�A�o�����`���b�V��3
[State -1, A-Slash]
type = ChangeState
value = 1102
triggerall = (command = "BF_ccc" )
triggerall = stateno = 1101
trigger1 = time = [15,25]
trigger2 = movecontact
trigger2 = time <= 25

;---------------------------------------------------------------------------
;�A�b�p�[�X���b�V��
[State -1, U-Rush]
type = ChangeState
value = 1200
triggerall = command = "DU_a"
trigger1 = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
;---------------------------------------------------------------------------
;�A�b�p�[�X���b�V��
[State -1, U-Rush]
type = ChangeState
value = 1210
triggerall = command = "DU_c"
trigger1 = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
;---------------------------------------------------------------------------
;===========================================================================
;---------------------------------------------------------------------------
;�O���_�b�V��
[State -1, Dash Forward]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = stateno != 100 && stateno != 105

;---------------------------------------------------------------------------
;��ރ_�b�V��
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;����
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "c"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 3
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 5
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;===========================================================================
;---------------------------------------------------------------------------
;�����p���`
[State -1, Stand Panch]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (Stateno = 400) && movecontact = 1

;---------------------------------------------------------------------------
;�����L�b�N
[State -1, Stand Kick]
type = ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (Stateno = 200) && movecontact = 1
trigger3 = (Stateno = 400) && movecontact = 1
trigger4 = (Stateno = 410) && movecontact = 1

;---------------------------------------------------------------------------
;�������U��
[State -1, Standing Strong Attack]
type = ChangeState
value = 220
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (Stateno = 200) && movecontact = 1
trigger3 = (Stateno = 210) && movecontact = 1
trigger4 = (Stateno = 400) && movecontact = 1
trigger5 = (Stateno = 410) && movecontact = 1
trigger6 = (Stateno = 420) && movecontact = 1

;---------------------------------------------------------------------------
;���Ⴊ�݃p���`
[State -1, Crouching Panch]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (Stateno = 200) && movecontact = 1

;---------------------------------------------------------------------------
;���Ⴊ�݃L�b�N
[State -1, Crouching Kick]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (Stateno = 200) && movecontact = 1
trigger3 = (Stateno = 210) && movecontact = 1
trigger4 = (Stateno = 400) && movecontact = 1

;---------------------------------------------------------------------------
;���Ⴊ�݋��U��
[State -1, Crouching Strong Attack]
type = ChangeState
value = 420
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (Stateno = 200) && movecontact = 1
trigger3 = (Stateno = 210) && movecontact = 1
trigger4 = (Stateno = 220) && movecontact = 1
trigger5 = (Stateno = 400) && movecontact = 1
trigger6 = (Stateno = 410) && movecontact = 1

;---------------------------------------------------------------------------
;�W�����v�p���`
[State -1, Jump Panch]
type = ChangeState
value = 600
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;�W�����v�L�b�N
[State -1, Jump Kick]
type = ChangeState
value = 610
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (Stateno = 600) && movecontact = 1

;---------------------------------------------------------------------------
;�W�����v���U��
[State -1, Jump Strong Attack]
type = ChangeState
value = 620
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (Stateno = 600) && movecontact = 1
trigger3 = (Stateno = 610) && movecontact = 1

