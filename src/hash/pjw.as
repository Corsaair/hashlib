/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;
    
    /**
     * Peter J Weinberger (of AT&#38;T Bell Labs) hash function.
     * 
     * <p>
     * The book Compilers (Principles, Techniques and Tools) by Aho, Sethi and Ulman,
     * recommends the use of hash functions that employ the hashing methodology
     * found in this particular algorithm.
     * </p>
     * 
     * @return a 32bits digest
     * 
     * @playerversion Flash 9
     * @playerversion AIR 1.0
     * @playerversion AVM 0.4
     * @langversion 3.0
     */ 
    public function pjw( bytes:ByteArray ):uint
    {
        var bitsInUnsignedInt:uint = uint( 4 * 8 );
        var threeQuarters:uint     = uint( uint( bitsInUnsignedInt * 3 ) / 4 );
        var oneEighth:uint         = uint( bitsInUnsignedInt / 8 );
        var highBits:uint          = uint( 0xFFFFFFFF << (bitsInUnsignedInt - oneEighth) );
        var hash:uint;
        var test:uint;
        
        var i:uint;
        var c:uint;
        var len:uint = bytes.length;
        bytes.position = 0;
        for( i = 0; i < len; i++ )
        {
            c    = uint( bytes[ i ] );
            hash = uint( hash << oneEighth ) + c;
            test = hash & highBits;
            
            if( test != 0 )
            {
                hash = (( hash ^ (test >>> threeQuarters)) & (~highBits));
            }
        }
        
        return hash;
    }

}