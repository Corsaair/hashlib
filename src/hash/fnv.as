/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;
    
    /**
     * Fowler–Noll–Vo hash function.
     * 
     * <p>
     * Created by Glenn Fowler, Landon Curt Noll, and Phong Vo,
     * this algorithm is widely used by Domain Name Servers, databases, email servers, etc.
     * </p>
     * 
     * @return a 32bits digest
     * 
     * @playerversion Flash 9
     * @playerversion AIR 1.0
     * @playerversion AVM 0.4
     * @langversion 3.0
     * 
     * @see http://www.isthe.com/chongo/tech/comp/fnv/index.html FNV Hash
     * @see http://en.wikipedia.org/wiki/Fowler_Noll_Vo_hash Fowler–Noll–Vo hash function
     */
    public function fnv( bytes:ByteArray ):uint
    {
        var fnv_prime:uint = 0x811C9DC5;
        var h:uint;
        
        var i:uint;
        var c:uint;
        var len:uint  = bytes.length;
        bytes.position = 0;
        for( i = 0; i < len; i++ )
        {
            c    = uint( bytes[ i ] );
            h = uint( h * fnv_prime );
            h = uint( h ^ c);
        }
        
        return h;
    }

}