struct Image
    data::Array{UInt8}
    nrows::Unsigned
    ncols::Unsigned
end
Image(nrows::Unsigned, ncols::Unsigned) = Image(zeros(UInt8, nrows, ncols, 3), nrows, ncols)

function imwrite(img::Image, filename::String)
    out = open(filename, "w")
    try
        header = ascii("P6\n$(img.ncols) $(img.nrows)\n255\n")
        for i in eachindex(header)
            write(out, Char(header[i]))
        end
        for l in 1:img.nrows
            for c in 1:img.ncols
                for i in 1:3
                    write(out, img.data[l, c, i])
                end
            end
        end
    catch e
        println(e)
    finally
        close(out)
    end
end