; ModuleID = 'probe1.2a93f9e81c37825-cgu.0'
source_filename = "probe1.2a93f9e81c37825-cgu.0"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"

%"core::fmt::Arguments<'_>" = type { { ptr, i64 }, { ptr, i64 }, { ptr, i64 } }
%"alloc::string::String" = type { %"alloc::vec::Vec<u8>" }
%"alloc::vec::Vec<u8>" = type { { i64, ptr }, i64 }
%"core::ptr::metadata::PtrRepr<[u8]>" = type { [2 x i64] }
%"alloc::alloc::Global" = type {}
%"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>" = type { [1 x i64], i64, [1 x i64] }

@0 = private unnamed_addr constant <{ [8 x i8], [8 x i8] }> <{ [8 x i8] zeroinitializer, [8 x i8] undef }>, align 8
@alloc_91c7fa63c3cfeaa3c795652d5cf060e4 = private unnamed_addr constant <{ [12 x i8] }> <{ [12 x i8] c"invalid args" }>, align 1
@alloc_af99043bc04c419363a7f04d23183506 = private unnamed_addr constant <{ ptr, [8 x i8] }> <{ ptr @alloc_91c7fa63c3cfeaa3c795652d5cf060e4, [8 x i8] c"\0C\00\00\00\00\00\00\00" }>, align 8
@alloc_513570631223a12912d85da2bec3b15a = private unnamed_addr constant <{}> zeroinitializer, align 8
@alloc_43ed18930676fdde459c93149b3fa1f2 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/e51e98dde6a60637b6a71b8105245b629ac3fe77\\library\\core\\src\\fmt\\mod.rs" }>, align 1
@alloc_01b60d2a31e34bc6b9aa4940bfb7df8f = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_43ed18930676fdde459c93149b3fa1f2, [16 x i8] c"K\00\00\00\00\00\00\00M\01\00\00\0D\00\00\00" }>, align 8
@alloc_3f42fbbffd82a161737d43d4d5914c17 = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_43ed18930676fdde459c93149b3fa1f2, [16 x i8] c"K\00\00\00\00\00\00\00C\01\00\00\0D\00\00\00" }>, align 8
@alloc_c8988af1803d54afb26bff134bb5ee24 = private unnamed_addr constant <{ [80 x i8] }> <{ [80 x i8] c"/rustc/e51e98dde6a60637b6a71b8105245b629ac3fe77\\library\\core\\src\\alloc\\layout.rs" }>, align 1
@alloc_5fca521793bd81025fd2a6b3dfb32069 = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_c8988af1803d54afb26bff134bb5ee24, [16 x i8] c"P\00\00\00\00\00\00\00\C1\01\00\00)\00\00\00" }>, align 8
@str.0 = internal unnamed_addr constant [25 x i8] c"attempt to divide by zero"
@__rust_no_alloc_shim_is_unstable = external global i8
@alloc_b99730e73100e73a81f4fbfe74b3821d = private unnamed_addr constant <{ ptr, [8 x i8] }> <{ ptr @alloc_513570631223a12912d85da2bec3b15a, [8 x i8] zeroinitializer }>, align 8
@alloc_53973d2fe29b4adba8bb7390b5678745 = private unnamed_addr constant <{ [8 x i8] }> zeroinitializer, align 8

; core::fmt::Arguments::new_v1
; Function Attrs: inlinehint uwtable
define internal void @_ZN4core3fmt9Arguments6new_v117h4bb8f2d36400ec88E(ptr sret(%"core::fmt::Arguments<'_>") align 8 %_0, ptr align 8 %pieces.0, i64 %pieces.1, ptr align 8 %args.0, i64 %args.1) unnamed_addr #0 {
start:
  %_14 = alloca %"core::fmt::Arguments<'_>", align 8
  %_9 = alloca %"core::fmt::Arguments<'_>", align 8
  %_3 = icmp ult i64 %pieces.1, %args.1
  br i1 %_3, label %bb2, label %bb1

bb1:                                              ; preds = %start
  %_7 = add i64 %args.1, 1
  %_6 = icmp ugt i64 %pieces.1, %_7
  br i1 %_6, label %bb2, label %bb3

bb2:                                              ; preds = %bb1, %start
  br i1 false, label %bb4, label %bb6

bb3:                                              ; preds = %bb1
  %0 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  store ptr %pieces.0, ptr %0, align 8
  %1 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  store i64 %pieces.1, ptr %1, align 8
  %2 = load ptr, ptr @0, align 8, !align !2, !noundef !3
  %3 = load i64, ptr getelementptr inbounds ({ ptr, i64 }, ptr @0, i32 0, i32 1), align 8
  %4 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_0, i32 0, i32 2
  %5 = getelementptr inbounds { ptr, i64 }, ptr %4, i32 0, i32 0
  store ptr %2, ptr %5, align 8
  %6 = getelementptr inbounds { ptr, i64 }, ptr %4, i32 0, i32 1
  store i64 %3, ptr %6, align 8
  %7 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_0, i32 0, i32 1
  %8 = getelementptr inbounds { ptr, i64 }, ptr %7, i32 0, i32 0
  store ptr %args.0, ptr %8, align 8
  %9 = getelementptr inbounds { ptr, i64 }, ptr %7, i32 0, i32 1
  store i64 %args.1, ptr %9, align 8
  ret void

bb6:                                              ; preds = %bb2
  %10 = getelementptr inbounds { ptr, i64 }, ptr %_9, i32 0, i32 0
  store ptr @alloc_af99043bc04c419363a7f04d23183506, ptr %10, align 8
  %11 = getelementptr inbounds { ptr, i64 }, ptr %_9, i32 0, i32 1
  store i64 1, ptr %11, align 8
  %12 = load ptr, ptr @0, align 8, !align !2, !noundef !3
  %13 = load i64, ptr getelementptr inbounds ({ ptr, i64 }, ptr @0, i32 0, i32 1), align 8
  %14 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_9, i32 0, i32 2
  %15 = getelementptr inbounds { ptr, i64 }, ptr %14, i32 0, i32 0
  store ptr %12, ptr %15, align 8
  %16 = getelementptr inbounds { ptr, i64 }, ptr %14, i32 0, i32 1
  store i64 %13, ptr %16, align 8
  %17 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_9, i32 0, i32 1
  %18 = getelementptr inbounds { ptr, i64 }, ptr %17, i32 0, i32 0
  store ptr @alloc_513570631223a12912d85da2bec3b15a, ptr %18, align 8
  %19 = getelementptr inbounds { ptr, i64 }, ptr %17, i32 0, i32 1
  store i64 0, ptr %19, align 8
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17hd19b9b0f272597d4E(ptr align 8 %_9, ptr align 8 @alloc_01b60d2a31e34bc6b9aa4940bfb7df8f) #12
  unreachable

bb4:                                              ; preds = %bb2
; call core::fmt::Arguments::new_const
  call void @_ZN4core3fmt9Arguments9new_const17habc980a9e005e2cfE(ptr sret(%"core::fmt::Arguments<'_>") align 8 %_14, ptr align 8 @alloc_af99043bc04c419363a7f04d23183506, i64 1)
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17hd19b9b0f272597d4E(ptr align 8 %_14, ptr align 8 @alloc_3f42fbbffd82a161737d43d4d5914c17) #12
  unreachable
}

; core::fmt::Arguments::new_const
; Function Attrs: inlinehint uwtable
define internal void @_ZN4core3fmt9Arguments9new_const17habc980a9e005e2cfE(ptr sret(%"core::fmt::Arguments<'_>") align 8 %_0, ptr align 8 %pieces.0, i64 %pieces.1) unnamed_addr #0 {
start:
  %_5 = alloca %"core::fmt::Arguments<'_>", align 8
  %_2 = icmp ugt i64 %pieces.1, 1
  br i1 %_2, label %bb1, label %bb3

bb3:                                              ; preds = %start
  %0 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  store ptr %pieces.0, ptr %0, align 8
  %1 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  store i64 %pieces.1, ptr %1, align 8
  %2 = load ptr, ptr @0, align 8, !align !2, !noundef !3
  %3 = load i64, ptr getelementptr inbounds ({ ptr, i64 }, ptr @0, i32 0, i32 1), align 8
  %4 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_0, i32 0, i32 2
  %5 = getelementptr inbounds { ptr, i64 }, ptr %4, i32 0, i32 0
  store ptr %2, ptr %5, align 8
  %6 = getelementptr inbounds { ptr, i64 }, ptr %4, i32 0, i32 1
  store i64 %3, ptr %6, align 8
  %7 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_0, i32 0, i32 1
  %8 = getelementptr inbounds { ptr, i64 }, ptr %7, i32 0, i32 0
  store ptr @alloc_513570631223a12912d85da2bec3b15a, ptr %8, align 8
  %9 = getelementptr inbounds { ptr, i64 }, ptr %7, i32 0, i32 1
  store i64 0, ptr %9, align 8
  ret void

bb1:                                              ; preds = %start
; call core::fmt::Arguments::new_const
  call void @_ZN4core3fmt9Arguments9new_const17habc980a9e005e2cfE(ptr sret(%"core::fmt::Arguments<'_>") align 8 %_5, ptr align 8 @alloc_af99043bc04c419363a7f04d23183506, i64 1)
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17hd19b9b0f272597d4E(ptr align 8 %_5, ptr align 8 @alloc_3f42fbbffd82a161737d43d4d5914c17) #12
  unreachable
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint uwtable
define internal void @_ZN4core3ops8function6FnOnce9call_once17hc5de32ebcbc90445E(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 1 %0, i64 %1) unnamed_addr #0 {
start:
  %_2 = alloca { ptr, i64 }, align 8
  %2 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 0
  store ptr %0, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 1
  store i64 %1, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8, !nonnull !3, !align !4, !noundef !3
  %6 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 1
  %7 = load i64, ptr %6, align 8, !noundef !3
; call alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
  call void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17h665c0da2a2f9c3dfE"(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 1 %5, i64 %7)
  ret void
}

; core::ptr::drop_in_place<alloc::string::String>
; Function Attrs: uwtable
define void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h6eef46483447f743E"(ptr align 8 %_1) unnamed_addr #1 {
start:
; call core::ptr::drop_in_place<alloc::vec::Vec<u8>>
  call void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h5be0cefe35d6e322E"(ptr align 8 %_1)
  ret void
}

; core::ptr::drop_in_place<alloc::vec::Vec<u8>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h5be0cefe35d6e322E"(ptr align 8 %_1) unnamed_addr #1 personality ptr @__CxxFrameHandler3 {
start:
; invoke <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
  invoke void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h169045dfa1c80db1E"(ptr align 8 %_1)
          to label %bb4 unwind label %funclet_bb3

bb3:                                              ; preds = %funclet_bb3
; call core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  call void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17hcaf44559ae51b873E"(ptr align 8 %_1) #13 [ "funclet"(token %cleanuppad) ]
  cleanupret from %cleanuppad unwind to caller

funclet_bb3:                                      ; preds = %start
  %cleanuppad = cleanuppad within none []
  br label %bb3

bb4:                                              ; preds = %start
; call core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  call void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17hcaf44559ae51b873E"(ptr align 8 %_1)
  ret void
}

; core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17hcaf44559ae51b873E"(ptr align 8 %_1) unnamed_addr #1 {
start:
; call <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
  call void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h98e6010cab445a1bE"(ptr align 8 %_1)
  ret void
}

; core::alloc::layout::Layout::array::inner
; Function Attrs: inlinehint uwtable
define internal { i64, i64 } @_ZN4core5alloc6layout6Layout5array5inner17h692a359df169c197E(i64 %element_size, i64 %align, i64 %n) unnamed_addr #0 {
start:
  %_18 = alloca i64, align 8
  %_13 = alloca i64, align 8
  %_9 = alloca { i64, i64 }, align 8
  %_0 = alloca { i64, i64 }, align 8
  %0 = icmp eq i64 %element_size, 0
  br i1 %0, label %bb5, label %bb1

bb5:                                              ; preds = %bb4, %start
  %array_size = mul nuw i64 %element_size, %n
  store i64 %align, ptr %_18, align 8
  %_19 = load i64, ptr %_18, align 8, !range !5, !noundef !3
  %_20 = icmp uge i64 %_19, 1
  %_21 = icmp ule i64 %_19, -9223372036854775808
  %_22 = and i1 %_20, %_21
  call void @llvm.assume(i1 %_22)
  %1 = getelementptr inbounds { i64, i64 }, ptr %_9, i32 0, i32 1
  store i64 %array_size, ptr %1, align 8
  store i64 %_19, ptr %_9, align 8
  %2 = getelementptr inbounds { i64, i64 }, ptr %_9, i32 0, i32 0
  %3 = load i64, ptr %2, align 8, !range !5, !noundef !3
  %4 = getelementptr inbounds { i64, i64 }, ptr %_9, i32 0, i32 1
  %5 = load i64, ptr %4, align 8, !noundef !3
  %6 = getelementptr inbounds { i64, i64 }, ptr %_0, i32 0, i32 0
  store i64 %3, ptr %6, align 8
  %7 = getelementptr inbounds { i64, i64 }, ptr %_0, i32 0, i32 1
  store i64 %5, ptr %7, align 8
  br label %bb6

bb1:                                              ; preds = %start
  store i64 %align, ptr %_13, align 8
  %_14 = load i64, ptr %_13, align 8, !range !5, !noundef !3
  %_15 = icmp uge i64 %_14, 1
  %_16 = icmp ule i64 %_14, -9223372036854775808
  %_17 = and i1 %_15, %_16
  call void @llvm.assume(i1 %_17)
  %_11 = sub i64 %_14, 1
  %_6 = sub i64 9223372036854775807, %_11
  %_7 = icmp eq i64 %element_size, 0
  %8 = call i1 @llvm.expect.i1(i1 %_7, i1 false)
  br i1 %8, label %panic, label %bb2

bb2:                                              ; preds = %bb1
  %_5 = udiv i64 %_6, %element_size
  %_4 = icmp ugt i64 %n, %_5
  br i1 %_4, label %bb3, label %bb4

panic:                                            ; preds = %bb1
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h38eb4fad999c4bcbE(ptr align 1 @str.0, i64 25, ptr align 8 @alloc_5fca521793bd81025fd2a6b3dfb32069) #12
  unreachable

bb4:                                              ; preds = %bb2
  br label %bb5

bb3:                                              ; preds = %bb2
  %9 = load i64, ptr @0, align 8, !range !6, !noundef !3
  %10 = load i64, ptr getelementptr inbounds ({ i64, i64 }, ptr @0, i32 0, i32 1), align 8
  %11 = getelementptr inbounds { i64, i64 }, ptr %_0, i32 0, i32 0
  store i64 %9, ptr %11, align 8
  %12 = getelementptr inbounds { i64, i64 }, ptr %_0, i32 0, i32 1
  store i64 %10, ptr %12, align 8
  br label %bb6

bb6:                                              ; preds = %bb3, %bb5
  %13 = getelementptr inbounds { i64, i64 }, ptr %_0, i32 0, i32 0
  %14 = load i64, ptr %13, align 8, !range !6, !noundef !3
  %15 = getelementptr inbounds { i64, i64 }, ptr %_0, i32 0, i32 1
  %16 = load i64, ptr %15, align 8
  %17 = insertvalue { i64, i64 } poison, i64 %14, 0
  %18 = insertvalue { i64, i64 } %17, i64 %16, 1
  ret { i64, i64 } %18
}

; core::option::Option<T>::map_or_else
; Function Attrs: inlinehint uwtable
define void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17he8dcea960dc625afE"(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 1 %0, i64 %1, ptr align 8 %default) unnamed_addr #0 personality ptr @__CxxFrameHandler3 {
start:
  %_10 = alloca i8, align 1
  %_9 = alloca i8, align 1
  %_7 = alloca { ptr, i64 }, align 8
  %self = alloca { ptr, i64 }, align 8
  %2 = getelementptr inbounds { ptr, i64 }, ptr %self, i32 0, i32 0
  store ptr %0, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, i64 }, ptr %self, i32 0, i32 1
  store i64 %1, ptr %3, align 8
  store i8 1, ptr %_10, align 1
  store i8 1, ptr %_9, align 1
  %4 = load ptr, ptr %self, align 8, !noundef !3
  %5 = ptrtoint ptr %4 to i64
  %6 = icmp eq i64 %5, 0
  %_4 = select i1 %6, i64 0, i64 1
  %7 = icmp eq i64 %_4, 0
  br i1 %7, label %bb1, label %bb3

bb1:                                              ; preds = %start
  store i8 0, ptr %_10, align 1
; invoke alloc::fmt::format::{{closure}}
  invoke void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17h1cdeba320e77cc61E"(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 8 %default)
          to label %bb5 unwind label %funclet_bb14

bb3:                                              ; preds = %start
  %8 = getelementptr inbounds { ptr, i64 }, ptr %self, i32 0, i32 0
  %t.0 = load ptr, ptr %8, align 8, !nonnull !3, !align !4, !noundef !3
  %9 = getelementptr inbounds { ptr, i64 }, ptr %self, i32 0, i32 1
  %t.1 = load i64, ptr %9, align 8, !noundef !3
  store i8 0, ptr %_9, align 1
  %10 = getelementptr inbounds { ptr, i64 }, ptr %_7, i32 0, i32 0
  store ptr %t.0, ptr %10, align 8
  %11 = getelementptr inbounds { ptr, i64 }, ptr %_7, i32 0, i32 1
  store i64 %t.1, ptr %11, align 8
  %12 = getelementptr inbounds { ptr, i64 }, ptr %_7, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8, !nonnull !3, !align !4, !noundef !3
  %14 = getelementptr inbounds { ptr, i64 }, ptr %_7, i32 0, i32 1
  %15 = load i64, ptr %14, align 8, !noundef !3
; invoke core::ops::function::FnOnce::call_once
  invoke void @_ZN4core3ops8function6FnOnce9call_once17hc5de32ebcbc90445E(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 1 %13, i64 %15)
          to label %bb4 unwind label %funclet_bb14

bb14:                                             ; preds = %funclet_bb14
  %16 = load i8, ptr %_9, align 1, !range !7, !noundef !3
  %17 = trunc i8 %16 to i1
  br i1 %17, label %bb13, label %bb14_cleanup_trampoline_bb8

funclet_bb14:                                     ; preds = %bb3, %bb1
  %cleanuppad = cleanuppad within none []
  br label %bb14

bb5:                                              ; preds = %bb1
  br label %bb11

bb11:                                             ; preds = %bb4, %bb5
  %18 = load i8, ptr %_9, align 1, !range !7, !noundef !3
  %19 = trunc i8 %18 to i1
  br i1 %19, label %bb10, label %bb6

bb4:                                              ; preds = %bb3
  br label %bb11

bb6:                                              ; preds = %bb10, %bb11
  %20 = load i8, ptr %_10, align 1, !range !7, !noundef !3
  %21 = trunc i8 %20 to i1
  br i1 %21, label %bb12, label %bb7

bb10:                                             ; preds = %bb11
  br label %bb6

bb7:                                              ; preds = %bb12, %bb6
  ret void

bb12:                                             ; preds = %bb6
  br label %bb7

bb8:                                              ; preds = %funclet_bb8
  %22 = load i8, ptr %_10, align 1, !range !7, !noundef !3
  %23 = trunc i8 %22 to i1
  br i1 %23, label %bb15, label %bb9

funclet_bb8:                                      ; preds = %bb13, %bb14_cleanup_trampoline_bb8
  %cleanuppad1 = cleanuppad within none []
  br label %bb8

bb14_cleanup_trampoline_bb8:                      ; preds = %bb14
  cleanupret from %cleanuppad unwind label %funclet_bb8

bb13:                                             ; preds = %bb14
  cleanupret from %cleanuppad unwind label %funclet_bb8

bb9:                                              ; preds = %bb15, %bb8
  cleanupret from %cleanuppad1 unwind to caller

bb15:                                             ; preds = %bb8
  br label %bb9

bb2:                                              ; No predecessors!
  unreachable
}

; <T as alloc::slice::hack::ConvertVec>::to_vec
; Function Attrs: inlinehint uwtable
define void @"_ZN52_$LT$T$u20$as$u20$alloc..slice..hack..ConvertVec$GT$6to_vec17h4c65395fe2763747E"(ptr sret(%"alloc::vec::Vec<u8>") align 8 %_0, ptr align 1 %s.0, i64 %s.1) unnamed_addr #0 personality ptr @__CxxFrameHandler3 {
start:
  %v = alloca %"alloc::vec::Vec<u8>", align 8
; invoke alloc::raw_vec::RawVec<T,A>::allocate_in
  %0 = invoke { i64, ptr } @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in17h23aa35aa87e73bbdE"(i64 %s.1, i1 zeroext false)
          to label %bb4 unwind label %funclet_bb3

bb3:                                              ; preds = %funclet_bb3
  br i1 false, label %bb2, label %bb1

funclet_bb3:                                      ; preds = %start
  %cleanuppad = cleanuppad within none []
  br label %bb3

bb4:                                              ; preds = %start
  %_13.0 = extractvalue { i64, ptr } %0, 0
  %_13.1 = extractvalue { i64, ptr } %0, 1
  %1 = getelementptr inbounds { i64, ptr }, ptr %v, i32 0, i32 0
  store i64 %_13.0, ptr %1, align 8
  %2 = getelementptr inbounds { i64, ptr }, ptr %v, i32 0, i32 1
  store ptr %_13.1, ptr %2, align 8
  %3 = getelementptr inbounds %"alloc::vec::Vec<u8>", ptr %v, i32 0, i32 1
  store i64 0, ptr %3, align 8
  %4 = getelementptr inbounds { i64, ptr }, ptr %v, i32 0, i32 1
  %self = load ptr, ptr %4, align 8, !nonnull !3, !noundef !3
  %5 = mul i64 %s.1, 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %self, ptr align 1 %s.0, i64 %5, i1 false)
  %6 = getelementptr inbounds %"alloc::vec::Vec<u8>", ptr %v, i32 0, i32 1
  store i64 %s.1, ptr %6, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %v, i64 24, i1 false)
  ret void

bb1:                                              ; preds = %bb2, %bb3
  cleanupret from %cleanuppad unwind to caller

bb2:                                              ; preds = %bb3
  br label %bb1
}

; alloc::fmt::format
; Function Attrs: inlinehint uwtable
define internal void @_ZN5alloc3fmt6format17h29b633fb655c7c9cE(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 8 %args) unnamed_addr #0 {
start:
  %_4 = alloca ptr, align 8
  %_2 = alloca { ptr, i64 }, align 8
  %0 = getelementptr inbounds { ptr, i64 }, ptr %args, i32 0, i32 0
  %_6.0 = load ptr, ptr %0, align 8, !nonnull !3, !align !2, !noundef !3
  %1 = getelementptr inbounds { ptr, i64 }, ptr %args, i32 0, i32 1
  %_6.1 = load i64, ptr %1, align 8, !noundef !3
  %2 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %args, i32 0, i32 1
  %3 = getelementptr inbounds { ptr, i64 }, ptr %2, i32 0, i32 0
  %_7.0 = load ptr, ptr %3, align 8, !nonnull !3, !align !2, !noundef !3
  %4 = getelementptr inbounds { ptr, i64 }, ptr %2, i32 0, i32 1
  %_7.1 = load i64, ptr %4, align 8, !noundef !3
  %5 = icmp eq i64 %_6.1, 0
  br i1 %5, label %bb3, label %bb5

bb3:                                              ; preds = %start
  %6 = icmp eq i64 %_7.1, 0
  br i1 %6, label %bb7, label %bb4

bb5:                                              ; preds = %start
  %7 = icmp eq i64 %_6.1, 1
  br i1 %7, label %bb6, label %bb4

bb7:                                              ; preds = %bb3
  %8 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 0
  store ptr @alloc_513570631223a12912d85da2bec3b15a, ptr %8, align 8
  %9 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 1
  store i64 0, ptr %9, align 8
  br label %bb2

bb4:                                              ; preds = %bb6, %bb5, %bb3
  %10 = load ptr, ptr @0, align 8, !align !4, !noundef !3
  %11 = load i64, ptr getelementptr inbounds ({ ptr, i64 }, ptr @0, i32 0, i32 1), align 8
  %12 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 0
  store ptr %10, ptr %12, align 8
  %13 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 1
  store i64 %11, ptr %13, align 8
  br label %bb2

bb2:                                              ; preds = %bb4, %bb8, %bb7
  store ptr %args, ptr %_4, align 8
  %14 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8, !align !4, !noundef !3
  %16 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 1
  %17 = load i64, ptr %16, align 8
  %18 = load ptr, ptr %_4, align 8, !nonnull !3, !align !2, !noundef !3
; call core::option::Option<T>::map_or_else
  call void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17he8dcea960dc625afE"(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 1 %15, i64 %17, ptr align 8 %18)
  ret void

bb6:                                              ; preds = %bb5
  %19 = icmp eq i64 %_7.1, 0
  br i1 %19, label %bb8, label %bb4

bb8:                                              ; preds = %bb6
  %s = getelementptr inbounds [0 x { ptr, i64 }], ptr %_6.0, i64 0, i64 0
  %20 = getelementptr inbounds [0 x { ptr, i64 }], ptr %_6.0, i64 0, i64 0
  %21 = getelementptr inbounds { ptr, i64 }, ptr %20, i32 0, i32 0
  %_13.0 = load ptr, ptr %21, align 8, !nonnull !3, !align !4, !noundef !3
  %22 = getelementptr inbounds { ptr, i64 }, ptr %20, i32 0, i32 1
  %_13.1 = load i64, ptr %22, align 8, !noundef !3
  %23 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 0
  store ptr %_13.0, ptr %23, align 8
  %24 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 1
  store i64 %_13.1, ptr %24, align 8
  br label %bb2
}

; alloc::fmt::format::{{closure}}
; Function Attrs: inlinehint uwtable
define void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17h1cdeba320e77cc61E"(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 8 %_1) unnamed_addr #0 {
start:
  %_2 = alloca %"core::fmt::Arguments<'_>", align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_2, ptr align 8 %_1, i64 48, i1 false)
; call alloc::fmt::format::format_inner
  call void @_ZN5alloc3fmt6format12format_inner17h58a8b6e151a079f2E(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 8 %_2)
  ret void
}

; alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
; Function Attrs: inlinehint uwtable
define internal void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17h665c0da2a2f9c3dfE"(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 1 %self.0, i64 %self.1) unnamed_addr #0 {
start:
  %bytes = alloca %"alloc::vec::Vec<u8>", align 8
; call <T as alloc::slice::hack::ConvertVec>::to_vec
  call void @"_ZN52_$LT$T$u20$as$u20$alloc..slice..hack..ConvertVec$GT$6to_vec17h4c65395fe2763747E"(ptr sret(%"alloc::vec::Vec<u8>") align 8 %bytes, ptr align 1 %self.0, i64 %self.1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %bytes, i64 24, i1 false)
  ret void
}

; alloc::alloc::Global::alloc_impl
; Function Attrs: inlinehint uwtable
define internal { ptr, i64 } @_ZN5alloc5alloc6Global10alloc_impl17h9a4a4b3926ea5820E(ptr align 1 %self, i64 %0, i64 %1, i1 zeroext %zeroed) unnamed_addr #0 {
start:
  %2 = alloca i8, align 1
  %_75 = alloca { ptr, i64 }, align 8
  %_74 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 8
  %_61 = alloca ptr, align 8
  %_56 = alloca i64, align 8
  %_42 = alloca i64, align 8
  %_33 = alloca { ptr, i64 }, align 8
  %_32 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 8
  %_22 = alloca i64, align 8
  %_18 = alloca { ptr, i64 }, align 8
  %self4 = alloca ptr, align 8
  %self3 = alloca ptr, align 8
  %_12 = alloca ptr, align 8
  %layout2 = alloca { i64, i64 }, align 8
  %layout1 = alloca { i64, i64 }, align 8
  %raw_ptr = alloca ptr, align 8
  %data = alloca ptr, align 8
  %_6 = alloca { ptr, i64 }, align 8
  %_0 = alloca { ptr, i64 }, align 8
  %layout = alloca { i64, i64 }, align 8
  %3 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 0
  store i64 %0, ptr %3, align 8
  %4 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  store i64 %1, ptr %4, align 8
  %5 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  %size = load i64, ptr %5, align 8, !noundef !3
  %6 = icmp eq i64 %size, 0
  br i1 %6, label %bb2, label %bb1

bb2:                                              ; preds = %start
  %self5 = load i64, ptr %layout, align 8, !range !5, !noundef !3
  store i64 %self5, ptr %_22, align 8
  %_23 = load i64, ptr %_22, align 8, !range !5, !noundef !3
  %_24 = icmp uge i64 %_23, 1
  %_25 = icmp ule i64 %_23, -9223372036854775808
  %_26 = and i1 %_24, %_25
  call void @llvm.assume(i1 %_26)
  %ptr = inttoptr i64 %_23 to ptr
  store ptr %ptr, ptr %data, align 8
  store ptr %ptr, ptr %_33, align 8
  %7 = getelementptr inbounds { ptr, i64 }, ptr %_33, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, i64 }, ptr %_33, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8, !noundef !3
  %10 = getelementptr inbounds { ptr, i64 }, ptr %_33, i32 0, i32 1
  %11 = load i64, ptr %10, align 8, !noundef !3
  %12 = getelementptr inbounds { ptr, i64 }, ptr %_32, i32 0, i32 0
  store ptr %9, ptr %12, align 8
  %13 = getelementptr inbounds { ptr, i64 }, ptr %_32, i32 0, i32 1
  store i64 %11, ptr %13, align 8
  %14 = getelementptr inbounds { ptr, i64 }, ptr %_32, i32 0, i32 0
  %ptr.0 = load ptr, ptr %14, align 8, !noundef !3
  %15 = getelementptr inbounds { ptr, i64 }, ptr %_32, i32 0, i32 1
  %ptr.1 = load i64, ptr %15, align 8, !noundef !3
  %16 = getelementptr inbounds { ptr, i64 }, ptr %_6, i32 0, i32 0
  store ptr %ptr.0, ptr %16, align 8
  %17 = getelementptr inbounds { ptr, i64 }, ptr %_6, i32 0, i32 1
  store i64 %ptr.1, ptr %17, align 8
  %18 = getelementptr inbounds { ptr, i64 }, ptr %_6, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8, !nonnull !3, !noundef !3
  %20 = getelementptr inbounds { ptr, i64 }, ptr %_6, i32 0, i32 1
  %21 = load i64, ptr %20, align 8, !noundef !3
  %22 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  store ptr %19, ptr %22, align 8
  %23 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  store i64 %21, ptr %23, align 8
  br label %bb9

bb1:                                              ; preds = %start
  br i1 %zeroed, label %bb3, label %bb4

bb9:                                              ; preds = %bb8, %bb6, %bb2
  %24 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8, !noundef !3
  %26 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  %27 = load i64, ptr %26, align 8
  %28 = insertvalue { ptr, i64 } poison, ptr %25, 0
  %29 = insertvalue { ptr, i64 } %28, i64 %27, 1
  ret { ptr, i64 } %29

bb4:                                              ; preds = %bb1
  %30 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 0
  %31 = load i64, ptr %30, align 8, !range !5, !noundef !3
  %32 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  %33 = load i64, ptr %32, align 8, !noundef !3
  %34 = getelementptr inbounds { i64, i64 }, ptr %layout2, i32 0, i32 0
  store i64 %31, ptr %34, align 8
  %35 = getelementptr inbounds { i64, i64 }, ptr %layout2, i32 0, i32 1
  store i64 %33, ptr %35, align 8
  %36 = load volatile i8, ptr @__rust_no_alloc_shim_is_unstable, align 1
  store i8 %36, ptr %2, align 1
  %_47 = load i8, ptr %2, align 1, !noundef !3
  %37 = getelementptr inbounds { i64, i64 }, ptr %layout2, i32 0, i32 1
  %_50 = load i64, ptr %37, align 8, !noundef !3
  %self6 = load i64, ptr %layout2, align 8, !range !5, !noundef !3
  store i64 %self6, ptr %_56, align 8
  %_57 = load i64, ptr %_56, align 8, !range !5, !noundef !3
  %_58 = icmp uge i64 %_57, 1
  %_59 = icmp ule i64 %_57, -9223372036854775808
  %_60 = and i1 %_58, %_59
  call void @llvm.assume(i1 %_60)
  %38 = call ptr @__rust_alloc(i64 %_50, i64 %_57) #14
  store ptr %38, ptr %raw_ptr, align 8
  br label %bb5

bb3:                                              ; preds = %bb1
  %39 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 0
  %40 = load i64, ptr %39, align 8, !range !5, !noundef !3
  %41 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  %42 = load i64, ptr %41, align 8, !noundef !3
  %43 = getelementptr inbounds { i64, i64 }, ptr %layout1, i32 0, i32 0
  store i64 %40, ptr %43, align 8
  %44 = getelementptr inbounds { i64, i64 }, ptr %layout1, i32 0, i32 1
  store i64 %42, ptr %44, align 8
  %45 = getelementptr inbounds { i64, i64 }, ptr %layout1, i32 0, i32 1
  %_37 = load i64, ptr %45, align 8, !noundef !3
  %self7 = load i64, ptr %layout1, align 8, !range !5, !noundef !3
  store i64 %self7, ptr %_42, align 8
  %_43 = load i64, ptr %_42, align 8, !range !5, !noundef !3
  %_44 = icmp uge i64 %_43, 1
  %_45 = icmp ule i64 %_43, -9223372036854775808
  %_46 = and i1 %_44, %_45
  call void @llvm.assume(i1 %_46)
  %46 = call ptr @__rust_alloc_zeroed(i64 %_37, i64 %_43) #14
  store ptr %46, ptr %raw_ptr, align 8
  br label %bb5

bb5:                                              ; preds = %bb3, %bb4
  %ptr8 = load ptr, ptr %raw_ptr, align 8, !noundef !3
  %_62 = ptrtoint ptr %ptr8 to i64
  %47 = icmp eq i64 %_62, 0
  br i1 %47, label %bb14, label %bb15

bb14:                                             ; preds = %bb5
  store ptr null, ptr %self4, align 8
  br label %bb13

bb15:                                             ; preds = %bb5
  store ptr %ptr8, ptr %_61, align 8
  %48 = load ptr, ptr %_61, align 8, !nonnull !3, !noundef !3
  store ptr %48, ptr %self4, align 8
  br label %bb13

bb13:                                             ; preds = %bb15, %bb14
  %49 = load ptr, ptr %self4, align 8, !noundef !3
  %50 = ptrtoint ptr %49 to i64
  %51 = icmp eq i64 %50, 0
  %_66 = select i1 %51, i64 0, i64 1
  %52 = icmp eq i64 %_66, 0
  br i1 %52, label %bb16, label %bb17

bb16:                                             ; preds = %bb13
  store ptr null, ptr %self3, align 8
  br label %bb18

bb17:                                             ; preds = %bb13
  %v = load ptr, ptr %self4, align 8, !nonnull !3, !noundef !3
  store ptr %v, ptr %self3, align 8
  br label %bb18

bb18:                                             ; preds = %bb17, %bb16
  %53 = load ptr, ptr %self3, align 8, !noundef !3
  %54 = ptrtoint ptr %53 to i64
  %55 = icmp eq i64 %54, 0
  %_68 = select i1 %55, i64 1, i64 0
  %56 = icmp eq i64 %_68, 0
  br i1 %56, label %bb21, label %bb20

bb21:                                             ; preds = %bb18
  %v9 = load ptr, ptr %self3, align 8, !nonnull !3, !noundef !3
  store ptr %v9, ptr %_12, align 8
  br label %bb19

bb20:                                             ; preds = %bb18
  store ptr null, ptr %_12, align 8
  br label %bb19

bb19:                                             ; preds = %bb20, %bb21
  %57 = load ptr, ptr %_12, align 8, !noundef !3
  %58 = ptrtoint ptr %57 to i64
  %59 = icmp eq i64 %58, 0
  %_16 = select i1 %59, i64 1, i64 0
  %60 = icmp eq i64 %_16, 0
  br i1 %60, label %bb6, label %bb8

bb6:                                              ; preds = %bb19
  %ptr10 = load ptr, ptr %_12, align 8, !nonnull !3, !noundef !3
  store ptr %ptr10, ptr %_75, align 8
  %61 = getelementptr inbounds { ptr, i64 }, ptr %_75, i32 0, i32 1
  store i64 %size, ptr %61, align 8
  %62 = getelementptr inbounds { ptr, i64 }, ptr %_75, i32 0, i32 0
  %63 = load ptr, ptr %62, align 8, !noundef !3
  %64 = getelementptr inbounds { ptr, i64 }, ptr %_75, i32 0, i32 1
  %65 = load i64, ptr %64, align 8, !noundef !3
  %66 = getelementptr inbounds { ptr, i64 }, ptr %_74, i32 0, i32 0
  store ptr %63, ptr %66, align 8
  %67 = getelementptr inbounds { ptr, i64 }, ptr %_74, i32 0, i32 1
  store i64 %65, ptr %67, align 8
  %68 = getelementptr inbounds { ptr, i64 }, ptr %_74, i32 0, i32 0
  %ptr.011 = load ptr, ptr %68, align 8, !noundef !3
  %69 = getelementptr inbounds { ptr, i64 }, ptr %_74, i32 0, i32 1
  %ptr.112 = load i64, ptr %69, align 8, !noundef !3
  %70 = getelementptr inbounds { ptr, i64 }, ptr %_18, i32 0, i32 0
  store ptr %ptr.011, ptr %70, align 8
  %71 = getelementptr inbounds { ptr, i64 }, ptr %_18, i32 0, i32 1
  store i64 %ptr.112, ptr %71, align 8
  %72 = getelementptr inbounds { ptr, i64 }, ptr %_18, i32 0, i32 0
  %73 = load ptr, ptr %72, align 8, !nonnull !3, !noundef !3
  %74 = getelementptr inbounds { ptr, i64 }, ptr %_18, i32 0, i32 1
  %75 = load i64, ptr %74, align 8, !noundef !3
  %76 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  store ptr %73, ptr %76, align 8
  %77 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  store i64 %75, ptr %77, align 8
  br label %bb9

bb8:                                              ; preds = %bb19
  %78 = load ptr, ptr @0, align 8, !noundef !3
  %79 = load i64, ptr getelementptr inbounds ({ ptr, i64 }, ptr @0, i32 0, i32 1), align 8
  %80 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  store ptr %78, ptr %80, align 8
  %81 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  store i64 %79, ptr %81, align 8
  br label %bb9

bb7:                                              ; No predecessors!
  unreachable
}

; alloc::raw_vec::RawVec<T,A>::allocate_in
; Function Attrs: uwtable
define { i64, ptr } @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in17h23aa35aa87e73bbdE"(i64 %capacity, i1 zeroext %0) unnamed_addr #1 personality ptr @__CxxFrameHandler3 {
start:
  %_44 = alloca ptr, align 8
  %_30 = alloca ptr, align 8
  %_29 = alloca ptr, align 8
  %_26 = alloca i64, align 8
  %self = alloca ptr, align 8
  %_23 = alloca ptr, align 8
  %result = alloca { ptr, i64 }, align 8
  %_7 = alloca { i64, i64 }, align 8
  %layout = alloca { i64, i64 }, align 8
  %_0 = alloca { i64, ptr }, align 8
  %alloc = alloca %"alloc::alloc::Global", align 1
  %init = alloca i8, align 1
  %1 = zext i1 %0 to i8
  store i8 %1, ptr %init, align 1
  br i1 false, label %bb2, label %bb1

bb1:                                              ; preds = %start
  %2 = icmp eq i64 %capacity, 0
  br i1 %2, label %bb2, label %bb3

bb2:                                              ; preds = %bb1, %start
  store ptr inttoptr (i64 1 to ptr), ptr %_30, align 8
  %3 = load ptr, ptr %_30, align 8, !nonnull !3, !noundef !3
  store ptr %3, ptr %_29, align 8
  %4 = load ptr, ptr %_29, align 8, !nonnull !3, !noundef !3
  %5 = getelementptr inbounds { i64, ptr }, ptr %_0, i32 0, i32 1
  store ptr %4, ptr %5, align 8
  store i64 0, ptr %_0, align 8
  br label %bb14

bb3:                                              ; preds = %bb1
; invoke core::alloc::layout::Layout::array::inner
  %6 = invoke { i64, i64 } @_ZN4core5alloc6layout6Layout5array5inner17h692a359df169c197E(i64 1, i64 1, i64 %capacity)
          to label %bb18 unwind label %funclet_bb17

bb17:                                             ; preds = %funclet_bb17
  br i1 true, label %bb16, label %bb15

funclet_bb17:                                     ; preds = %bb4, %bb12, %bb7, %bb8, %bb3
  %cleanuppad = cleanuppad within none []
  br label %bb17

bb18:                                             ; preds = %bb3
  store { i64, i64 } %6, ptr %_7, align 8
  %7 = load i64, ptr %_7, align 8, !range !6, !noundef !3
  %8 = icmp eq i64 %7, 0
  %_8 = select i1 %8, i64 1, i64 0
  %9 = icmp eq i64 %_8, 0
  br i1 %9, label %bb6, label %bb4

bb6:                                              ; preds = %bb18
  %10 = getelementptr inbounds { i64, i64 }, ptr %_7, i32 0, i32 0
  %layout.0 = load i64, ptr %10, align 8, !range !5, !noundef !3
  %11 = getelementptr inbounds { i64, i64 }, ptr %_7, i32 0, i32 1
  %layout.1 = load i64, ptr %11, align 8, !noundef !3
  %12 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 0
  store i64 %layout.0, ptr %12, align 8
  %13 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  store i64 %layout.1, ptr %13, align 8
  %14 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  %alloc_size = load i64, ptr %14, align 8, !noundef !3
  %15 = load i8, ptr %init, align 1, !range !7, !noundef !3
  %16 = trunc i8 %15 to i1
  %_14 = zext i1 %16 to i64
  %17 = icmp eq i64 %_14, 0
  br i1 %17, label %bb8, label %bb7

bb4:                                              ; preds = %bb18
; invoke alloc::raw_vec::capacity_overflow
  invoke void @_ZN5alloc7raw_vec17capacity_overflow17h43d414a350d3578cE() #12
          to label %unreachable unwind label %funclet_bb17

bb8:                                              ; preds = %bb6
  %18 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 0
  %_16.0 = load i64, ptr %18, align 8, !range !5, !noundef !3
  %19 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  %_16.1 = load i64, ptr %19, align 8, !noundef !3
; invoke <alloc::alloc::Global as core::alloc::Allocator>::allocate
  %20 = invoke { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17hedeee22c3022aa2aE"(ptr align 1 %alloc, i64 %_16.0, i64 %_16.1)
          to label %bb9 unwind label %funclet_bb17

bb7:                                              ; preds = %bb6
  %21 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 0
  %_18.0 = load i64, ptr %21, align 8, !range !5, !noundef !3
  %22 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  %_18.1 = load i64, ptr %22, align 8, !noundef !3
; invoke <alloc::alloc::Global as core::alloc::Allocator>::allocate_zeroed
  %23 = invoke { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17hb0e5de7c70e2cc14E"(ptr align 1 %alloc, i64 %_18.0, i64 %_18.1)
          to label %bb10 unwind label %funclet_bb17

bb9:                                              ; preds = %bb8
  store { ptr, i64 } %20, ptr %result, align 8
  br label %bb11

bb11:                                             ; preds = %bb10, %bb9
  %24 = load ptr, ptr %result, align 8, !noundef !3
  %25 = ptrtoint ptr %24 to i64
  %26 = icmp eq i64 %25, 0
  %_19 = select i1 %26, i64 1, i64 0
  %27 = icmp eq i64 %_19, 0
  br i1 %27, label %bb13, label %bb12

bb10:                                             ; preds = %bb7
  store { ptr, i64 } %23, ptr %result, align 8
  br label %bb11

bb13:                                             ; preds = %bb11
  %28 = getelementptr inbounds { ptr, i64 }, ptr %result, i32 0, i32 0
  %ptr.0 = load ptr, ptr %28, align 8, !nonnull !3, !noundef !3
  %29 = getelementptr inbounds { ptr, i64 }, ptr %result, i32 0, i32 1
  %ptr.1 = load i64, ptr %29, align 8, !noundef !3
  store ptr %ptr.0, ptr %self, align 8
  store ptr %ptr.0, ptr %_44, align 8
  %30 = load ptr, ptr %_44, align 8, !nonnull !3, !noundef !3
  store ptr %30, ptr %_23, align 8
  store i64 %capacity, ptr %_26, align 8
  %31 = load ptr, ptr %_23, align 8, !nonnull !3, !noundef !3
  %32 = getelementptr inbounds { i64, ptr }, ptr %_0, i32 0, i32 1
  store ptr %31, ptr %32, align 8
  %33 = load i64, ptr %_26, align 8, !range !8, !noundef !3
  store i64 %33, ptr %_0, align 8
  br label %bb14

bb12:                                             ; preds = %bb11
  %34 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 0
  %_22.0 = load i64, ptr %34, align 8, !range !5, !noundef !3
  %35 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  %_22.1 = load i64, ptr %35, align 8, !noundef !3
; invoke alloc::alloc::handle_alloc_error
  invoke void @_ZN5alloc5alloc18handle_alloc_error17h03509bd8a9192fdfE(i64 %_22.0, i64 %_22.1) #12
          to label %unreachable unwind label %funclet_bb17

bb14:                                             ; preds = %bb2, %bb13
  %36 = getelementptr inbounds { i64, ptr }, ptr %_0, i32 0, i32 0
  %37 = load i64, ptr %36, align 8, !range !8, !noundef !3
  %38 = getelementptr inbounds { i64, ptr }, ptr %_0, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8, !nonnull !3, !noundef !3
  %40 = insertvalue { i64, ptr } poison, i64 %37, 0
  %41 = insertvalue { i64, ptr } %40, ptr %39, 1
  ret { i64, ptr } %41

unreachable:                                      ; preds = %bb4, %bb12
  unreachable

bb5:                                              ; No predecessors!
  unreachable

bb15:                                             ; preds = %bb16, %bb17
  cleanupret from %cleanuppad unwind to caller

bb16:                                             ; preds = %bb17
  br label %bb15
}

; alloc::raw_vec::RawVec<T,A>::current_memory
; Function Attrs: uwtable
define void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h335f4d51a1ead4b2E"(ptr sret(%"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>") align 8 %_0, ptr align 8 %self) unnamed_addr #1 {
start:
  %self2 = alloca ptr, align 8
  %self1 = alloca ptr, align 8
  %_10 = alloca ptr, align 8
  %_9 = alloca { ptr, { i64, i64 } }, align 8
  %layout = alloca { i64, i64 }, align 8
  br i1 false, label %bb2, label %bb1

bb1:                                              ; preds = %start
  %_3 = load i64, ptr %self, align 8, !noundef !3
  %0 = icmp eq i64 %_3, 0
  br i1 %0, label %bb2, label %bb3

bb2:                                              ; preds = %bb1, %start
  %1 = getelementptr inbounds %"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>", ptr %_0, i32 0, i32 1
  store i64 0, ptr %1, align 8
  br label %bb4

bb3:                                              ; preds = %bb1
  %rhs = load i64, ptr %self, align 8, !noundef !3
  %size = mul nuw i64 1, %rhs
  %2 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  store i64 %size, ptr %2, align 8
  store i64 1, ptr %layout, align 8
  %3 = getelementptr inbounds { i64, ptr }, ptr %self, i32 0, i32 1
  %self3 = load ptr, ptr %3, align 8, !nonnull !3, !noundef !3
  store ptr %self3, ptr %self1, align 8
  store ptr %self3, ptr %self2, align 8
  store ptr %self3, ptr %_10, align 8
  %4 = load ptr, ptr %_10, align 8, !nonnull !3, !noundef !3
  store ptr %4, ptr %_9, align 8
  %5 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 0
  %6 = load i64, ptr %5, align 8, !range !5, !noundef !3
  %7 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  %8 = load i64, ptr %7, align 8, !noundef !3
  %9 = getelementptr inbounds { ptr, { i64, i64 } }, ptr %_9, i32 0, i32 1
  %10 = getelementptr inbounds { i64, i64 }, ptr %9, i32 0, i32 0
  store i64 %6, ptr %10, align 8
  %11 = getelementptr inbounds { i64, i64 }, ptr %9, i32 0, i32 1
  store i64 %8, ptr %11, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %_9, i64 24, i1 false)
  br label %bb4

bb4:                                              ; preds = %bb2, %bb3
  ret void
}

; <alloc::alloc::Global as core::alloc::Allocator>::deallocate
; Function Attrs: inlinehint uwtable
define internal void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h4dd9801356f2874aE"(ptr align 1 %self, ptr %ptr, i64 %0, i64 %1) unnamed_addr #0 {
start:
  %_14 = alloca i64, align 8
  %layout1 = alloca { i64, i64 }, align 8
  %layout = alloca { i64, i64 }, align 8
  %2 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 0
  store i64 %0, ptr %2, align 8
  %3 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  store i64 %1, ptr %3, align 8
  %4 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  %_4 = load i64, ptr %4, align 8, !noundef !3
  %5 = icmp eq i64 %_4, 0
  br i1 %5, label %bb2, label %bb1

bb2:                                              ; preds = %start
  br label %bb3

bb1:                                              ; preds = %start
  %6 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 0
  %7 = load i64, ptr %6, align 8, !range !5, !noundef !3
  %8 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  %9 = load i64, ptr %8, align 8, !noundef !3
  %10 = getelementptr inbounds { i64, i64 }, ptr %layout1, i32 0, i32 0
  store i64 %7, ptr %10, align 8
  %11 = getelementptr inbounds { i64, i64 }, ptr %layout1, i32 0, i32 1
  store i64 %9, ptr %11, align 8
  %12 = getelementptr inbounds { i64, i64 }, ptr %layout1, i32 0, i32 1
  %_9 = load i64, ptr %12, align 8, !noundef !3
  %self2 = load i64, ptr %layout1, align 8, !range !5, !noundef !3
  store i64 %self2, ptr %_14, align 8
  %_15 = load i64, ptr %_14, align 8, !range !5, !noundef !3
  %_16 = icmp uge i64 %_15, 1
  %_17 = icmp ule i64 %_15, -9223372036854775808
  %_18 = and i1 %_16, %_17
  call void @llvm.assume(i1 %_18)
  call void @__rust_dealloc(ptr %ptr, i64 %_9, i64 %_15) #14
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  ret void
}

; <alloc::alloc::Global as core::alloc::Allocator>::allocate_zeroed
; Function Attrs: inlinehint uwtable
define internal { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17hb0e5de7c70e2cc14E"(ptr align 1 %self, i64 %layout.0, i64 %layout.1) unnamed_addr #0 {
start:
; call alloc::alloc::Global::alloc_impl
  %0 = call { ptr, i64 } @_ZN5alloc5alloc6Global10alloc_impl17h9a4a4b3926ea5820E(ptr align 1 %self, i64 %layout.0, i64 %layout.1, i1 zeroext true)
  %_0.0 = extractvalue { ptr, i64 } %0, 0
  %_0.1 = extractvalue { ptr, i64 } %0, 1
  %1 = insertvalue { ptr, i64 } poison, ptr %_0.0, 0
  %2 = insertvalue { ptr, i64 } %1, i64 %_0.1, 1
  ret { ptr, i64 } %2
}

; <alloc::alloc::Global as core::alloc::Allocator>::allocate
; Function Attrs: inlinehint uwtable
define internal { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17hedeee22c3022aa2aE"(ptr align 1 %self, i64 %layout.0, i64 %layout.1) unnamed_addr #0 {
start:
; call alloc::alloc::Global::alloc_impl
  %0 = call { ptr, i64 } @_ZN5alloc5alloc6Global10alloc_impl17h9a4a4b3926ea5820E(ptr align 1 %self, i64 %layout.0, i64 %layout.1, i1 zeroext false)
  %_0.0 = extractvalue { ptr, i64 } %0, 0
  %_0.1 = extractvalue { ptr, i64 } %0, 1
  %1 = insertvalue { ptr, i64 } poison, ptr %_0.0, 0
  %2 = insertvalue { ptr, i64 } %1, i64 %_0.1, 1
  ret { ptr, i64 } %2
}

; <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: uwtable
define void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h169045dfa1c80db1E"(ptr align 8 %self) unnamed_addr #1 {
start:
  %_10 = alloca { ptr, i64 }, align 8
  %_9 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 8
  %0 = getelementptr inbounds { i64, ptr }, ptr %self, i32 0, i32 1
  %self1 = load ptr, ptr %0, align 8, !nonnull !3, !noundef !3
  %1 = getelementptr inbounds %"alloc::vec::Vec<u8>", ptr %self, i32 0, i32 1
  %len = load i64, ptr %1, align 8, !noundef !3
  store ptr %self1, ptr %_10, align 8
  %2 = getelementptr inbounds { ptr, i64 }, ptr %_10, i32 0, i32 1
  store i64 %len, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, i64 }, ptr %_10, i32 0, i32 0
  %4 = load ptr, ptr %3, align 8, !noundef !3
  %5 = getelementptr inbounds { ptr, i64 }, ptr %_10, i32 0, i32 1
  %6 = load i64, ptr %5, align 8, !noundef !3
  %7 = getelementptr inbounds { ptr, i64 }, ptr %_9, i32 0, i32 0
  store ptr %4, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, i64 }, ptr %_9, i32 0, i32 1
  store i64 %6, ptr %8, align 8
  %9 = getelementptr inbounds { ptr, i64 }, ptr %_9, i32 0, i32 0
  %_2.0 = load ptr, ptr %9, align 8, !noundef !3
  %10 = getelementptr inbounds { ptr, i64 }, ptr %_9, i32 0, i32 1
  %_2.1 = load i64, ptr %10, align 8, !noundef !3
  ret void
}

; <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: uwtable
define void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h98e6010cab445a1bE"(ptr align 8 %self) unnamed_addr #1 {
start:
  %_2 = alloca %"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>", align 8
; call alloc::raw_vec::RawVec<T,A>::current_memory
  call void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h335f4d51a1ead4b2E"(ptr sret(%"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>") align 8 %_2, ptr align 8 %self)
  %0 = getelementptr inbounds %"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>", ptr %_2, i32 0, i32 1
  %1 = load i64, ptr %0, align 8, !range !6, !noundef !3
  %2 = icmp eq i64 %1, 0
  %_4 = select i1 %2, i64 0, i64 1
  %3 = icmp eq i64 %_4, 1
  br i1 %3, label %bb2, label %bb4

bb2:                                              ; preds = %start
  %ptr = load ptr, ptr %_2, align 8, !nonnull !3, !noundef !3
  %4 = getelementptr inbounds { ptr, { i64, i64 } }, ptr %_2, i32 0, i32 1
  %5 = getelementptr inbounds { i64, i64 }, ptr %4, i32 0, i32 0
  %layout.0 = load i64, ptr %5, align 8, !range !5, !noundef !3
  %6 = getelementptr inbounds { i64, i64 }, ptr %4, i32 0, i32 1
  %layout.1 = load i64, ptr %6, align 8, !noundef !3
  %_7 = getelementptr i8, ptr %self, i64 16
; call <alloc::alloc::Global as core::alloc::Allocator>::deallocate
  call void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h4dd9801356f2874aE"(ptr align 1 %_7, ptr %ptr, i64 %layout.0, i64 %layout.1)
  br label %bb4

bb4:                                              ; preds = %bb2, %start
  ret void
}

; probe1::probe
; Function Attrs: uwtable
define void @_ZN6probe15probe17h3f76b7dff785c43dE() unnamed_addr #1 {
start:
  %_0.i = alloca { ptr, ptr }, align 8
  %_7 = alloca [1 x { ptr, ptr }], align 8
  %_3 = alloca %"core::fmt::Arguments<'_>", align 8
  %res = alloca %"alloc::string::String", align 8
  %_1 = alloca %"alloc::string::String", align 8
  store ptr @alloc_53973d2fe29b4adba8bb7390b5678745, ptr %_0.i, align 8
  %0 = getelementptr inbounds { ptr, ptr }, ptr %_0.i, i32 0, i32 1
  store ptr @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17ha61c923e82c43bbfE", ptr %0, align 8
  %1 = load ptr, ptr %_0.i, align 8, !nonnull !3, !align !4, !noundef !3
  %2 = getelementptr inbounds { ptr, ptr }, ptr %_0.i, i32 0, i32 1
  %3 = load ptr, ptr %2, align 8, !nonnull !3, !noundef !3
  %4 = insertvalue { ptr, ptr } poison, ptr %1, 0
  %5 = insertvalue { ptr, ptr } %4, ptr %3, 1
  %_8.0 = extractvalue { ptr, ptr } %5, 0
  %_8.1 = extractvalue { ptr, ptr } %5, 1
  %6 = getelementptr inbounds [1 x { ptr, ptr }], ptr %_7, i64 0, i64 0
  %7 = getelementptr inbounds { ptr, ptr }, ptr %6, i32 0, i32 0
  store ptr %_8.0, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, ptr }, ptr %6, i32 0, i32 1
  store ptr %_8.1, ptr %8, align 8
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h4bb8f2d36400ec88E(ptr sret(%"core::fmt::Arguments<'_>") align 8 %_3, ptr align 8 @alloc_b99730e73100e73a81f4fbfe74b3821d, i64 1, ptr align 8 %_7, i64 1)
; call alloc::fmt::format
  call void @_ZN5alloc3fmt6format17h29b633fb655c7c9cE(ptr sret(%"alloc::string::String") align 8 %res, ptr align 8 %_3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_1, ptr align 8 %res, i64 24, i1 false)
; call core::ptr::drop_in_place<alloc::string::String>
  call void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h6eef46483447f743E"(ptr align 8 %_1)
  ret void
}

; core::fmt::num::imp::<impl core::fmt::LowerExp for isize>::fmt
; Function Attrs: uwtable
declare zeroext i1 @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17ha61c923e82c43bbfE"(ptr align 8, ptr align 8) unnamed_addr #1

; core::panicking::panic_fmt
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking9panic_fmt17hd19b9b0f272597d4E(ptr align 8, ptr align 8) unnamed_addr #2

declare i32 @__CxxFrameHandler3(...) unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.expect.i1(i1, i1) #5

; core::panicking::panic
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking5panic17h38eb4fad999c4bcbE(ptr align 1, i64, ptr align 8) unnamed_addr #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

; alloc::fmt::format::format_inner
; Function Attrs: uwtable
declare void @_ZN5alloc3fmt6format12format_inner17h58a8b6e151a079f2E(ptr sret(%"alloc::string::String") align 8, ptr align 8) unnamed_addr #1

; Function Attrs: nounwind allockind("alloc,uninitialized,aligned") allocsize(0) uwtable
declare noalias ptr @__rust_alloc(i64, i64 allocalign) unnamed_addr #7

; Function Attrs: nounwind allockind("alloc,zeroed,aligned") allocsize(0) uwtable
declare noalias ptr @__rust_alloc_zeroed(i64, i64 allocalign) unnamed_addr #8

; alloc::alloc::handle_alloc_error
; Function Attrs: cold noreturn uwtable
declare void @_ZN5alloc5alloc18handle_alloc_error17h03509bd8a9192fdfE(i64, i64) unnamed_addr #9

; alloc::raw_vec::capacity_overflow
; Function Attrs: noinline noreturn uwtable
declare void @_ZN5alloc7raw_vec17capacity_overflow17h43d414a350d3578cE() unnamed_addr #10

; Function Attrs: nounwind allockind("free") uwtable
declare void @__rust_dealloc(ptr allocptr, i64, i64) unnamed_addr #11

attributes #0 = { inlinehint uwtable "target-cpu"="x86-64" }
attributes #1 = { uwtable "target-cpu"="x86-64" }
attributes #2 = { cold noinline noreturn uwtable "target-cpu"="x86-64" }
attributes #3 = { "target-cpu"="x86-64" }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { nounwind allockind("alloc,uninitialized,aligned") allocsize(0) uwtable "alloc-family"="__rust_alloc" "target-cpu"="x86-64" }
attributes #8 = { nounwind allockind("alloc,zeroed,aligned") allocsize(0) uwtable "alloc-family"="__rust_alloc" "target-cpu"="x86-64" }
attributes #9 = { cold noreturn uwtable "target-cpu"="x86-64" }
attributes #10 = { noinline noreturn uwtable "target-cpu"="x86-64" }
attributes #11 = { nounwind allockind("free") uwtable "alloc-family"="__rust_alloc" "target-cpu"="x86-64" }
attributes #12 = { noreturn }
attributes #13 = { cold }
attributes #14 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.77.0-nightly (e51e98dde 2023-12-31)"}
!2 = !{i64 8}
!3 = !{}
!4 = !{i64 1}
!5 = !{i64 1, i64 -9223372036854775807}
!6 = !{i64 0, i64 -9223372036854775807}
!7 = !{i8 0, i8 2}
!8 = !{i64 0, i64 -9223372036854775808}
