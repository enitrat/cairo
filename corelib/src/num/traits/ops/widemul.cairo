/// A trait for types that can be multiplied together to produce a wider type.
pub trait WideMul<Lhs, Rhs> {
    /// The type of the result of the multiplication.
    type Target;
    /// Multiply two values together, producing a wider type.
    fn wide_mul(self: Lhs, v: Rhs) -> Self::Target;
}

impl WideMulI8 of WideMul<i8, i8> {
    type Target = i16;
    fn wide_mul(self: i8, v: i8) -> i16 {
        core::integer::i8_wide_mul(self, v)
    }
}

impl WideMulI16 of WideMul<i16, i16> {
    type Target = i32;
    fn wide_mul(self: i16, v: i16) -> i32 {
        core::integer::i16_wide_mul(self, v)
    }
}

impl WideMulI32 of WideMul<i32, i32> {
    type Target = i64;
    fn wide_mul(self: i32, v: i32) -> i64 {
        core::integer::i32_wide_mul(self, v)
    }
}

impl WideMulI64 of WideMul<i64, i64> {
    type Target = i128;
    fn wide_mul(self: i64, v: i64) -> i128 {
        core::integer::i64_wide_mul(self, v)
    }
}

impl WideMulU8 of WideMul<u8, u8> {
    type Target = u16;
    fn wide_mul(self: u8, v: u8) -> u16 {
        core::integer::u8_wide_mul(self, v)
    }
}

impl WideMulU16 of WideMul<u16, u16> {
    type Target = u32;
    fn wide_mul(self: u16, v: u16) -> u32 {
        core::integer::u16_wide_mul(self, v)
    }
}

impl WideMulU32 of WideMul<u32, u32> {
    type Target = u64;
    fn wide_mul(self: u32, v: u32) -> u64 {
        core::integer::u32_wide_mul(self, v)
    }
}

impl WideMulU64 of WideMul<u64, u64> {
    type Target = u128;
    fn wide_mul(self: u64, v: u64) -> u128 {
        core::integer::u64_wide_mul(self, v)
    }
}

impl WideMulU128 of WideMul<u128, u128> {
    type Target = u256;
    fn wide_mul(self: u128, v: u128) -> u256 {
        let (high, low) = core::integer::u128_wide_mul(self, v);
        u256 { low, high }
    }
}

impl WideMulU256 of WideMul<u256, u256> {
    type Target = core::integer::u512;
    fn wide_mul(self: u256, v: u256) -> core::integer::u512 {
        core::integer::u256_wide_mul(self, v)
    }
}
