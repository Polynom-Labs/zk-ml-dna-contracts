program zk_ml_dna_v0.aleo;

struct PatientAnswers:
    hadDesease as boolean;
    age as i8;
    gender as i8;

struct BiometricInput:
    x5 as i8;
    x7 as i8;
    x11 as i8;
    x12 as i8;
    x15 as i8;
    x20 as i8;
    x21 as i8;
    x25 as i8;
    x27 as i8;
    x31 as i8;

record RewardToken:
    owner as address.private;
    amount as u128.private;

record AnswersWithModelOutput:
    owner as address.private;
    answers as PatientAnswers.private;
    model_out as i8.private;


mapping distributed_rewards:
	key as u64.public;
	value as u128.public;


mapping submitted_biometric_inputs:
	key as field.public;
	value as boolean.public;

closure model:
    input r0 as i8;
    input r1 as i8;
    input r2 as i8;
    input r3 as i8;
    input r4 as i8;
    input r5 as i8;
    input r6 as i8;
    input r7 as i8;
    input r8 as i8;
    input r9 as i8;
    lte r7 8i8 into r10;
    lte r2 8i8 into r11;
    lte r3 8i8 into r12;
    lte r1 8i8 into r13;
    lte r8 8i8 into r14;
    lte r5 8i8 into r15;
    lte r6 8i8 into r16;
    lte r0 8i8 into r17;
    lte r4 8i8 into r18;
    lte r9 8i8 into r19;
    not r11 into r20;
    and r10 r20 into r21;
    not r14 into r22;
    and r21 r22 into r23;
    not r16 into r24;
    and r23 r24 into r25;
    ternary r25 0i8 10i8 into r26;
    not r11 into r27;
    and r10 r27 into r28;
    not r14 into r29;
    and r28 r29 into r30;
    and r30 r16 into r31;
    not r17 into r32;
    and r31 r32 into r33;
    ternary r33 16i8 r26 into r34;
    not r11 into r35;
    and r10 r35 into r36;
    not r14 into r37;
    and r36 r37 into r38;
    and r38 r16 into r39;
    and r39 r17 into r40;
    not r18 into r41;
    and r40 r41 into r42;
    not r19 into r43;
    and r42 r43 into r44;
    ternary r44 80i8 r34 into r45;
    not r11 into r46;
    and r10 r46 into r47;
    not r14 into r48;
    and r47 r48 into r49;
    and r49 r16 into r50;
    and r50 r17 into r51;
    not r18 into r52;
    and r51 r52 into r53;
    and r53 r19 into r54;
    ternary r54 96i8 r45 into r55;
    not r11 into r56;
    and r10 r56 into r57;
    not r14 into r58;
    and r57 r58 into r59;
    and r59 r16 into r60;
    and r60 r17 into r61;
    and r61 r18 into r62;
    ternary r62 32i8 r55 into r63;
    not r11 into r64;
    and r10 r64 into r65;
    and r65 r14 into r66;
    not r15 into r67;
    and r66 r67 into r68;
    ternary r68 14i8 r63 into r69;
    not r11 into r70;
    and r10 r70 into r71;
    and r71 r14 into r72;
    and r72 r15 into r73;
    ternary r73 64i8 r69 into r74;
    and r10 r11 into r75;
    not r12 into r76;
    and r75 r76 into r77;
    not r13 into r78;
    and r77 r78 into r79;
    ternary r79 127i8 r74 into r80;
    and r10 r11 into r81;
    not r12 into r82;
    and r81 r82 into r83;
    and r83 r13 into r84;
    ternary r84 48i8 r80 into r85;
    and r10 r11 into r86;
    and r86 r12 into r87;
    ternary r87 112i8 r85 into r88;
    output r88 as i8;


function submit:
    input r0 as PatientAnswers.private;
    input r1 as BiometricInput.private;
    hash.bhp256 r1 into r2 as field;
    call model r1.x5 r1.x7 r1.x11 r1.x12 r1.x15 r1.x20 r1.x21 r1.x25 r1.x27 r1.x31 into r3;
    cast aleo166zhnal73jv875wzsf6g75lutn56uj9tvxdfp3qgrawnk0nf3uzq25sqqv r0 r3 into r4 as AnswersWithModelOutput.record;
    cast self.caller 1000u128 into r5 as RewardToken.record;
    async submit r2 1000u128 into r6;
    output r4 as AnswersWithModelOutput.record;
    output r5 as RewardToken.record;
    output r6 as zk_ml_dna_v0.aleo/submit.future;

finalize submit:
    input r0 as field.public;
    input r1 as u128.public;
    contains submitted_biometric_inputs[r0] into r2;
    not r2 into r3;
    assert.eq r3 true;
    get.or_use distributed_rewards[1u64] 0u128 into r4;
    add r4 r1 into r5;
    set r5 into distributed_rewards[1u64];
    set true into submitted_biometric_inputs[r0];
