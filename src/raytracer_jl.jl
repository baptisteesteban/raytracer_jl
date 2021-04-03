module raytracer_jl

include("image.jl")

function main(output_filename::String)
    img = Image(convert(UInt8, 10), convert(UInt8, 10))
    for l in 1:img.nrows
        for c in 1:img.ncols
            img.data[l, c, 1] = convert(UInt8, l * img.ncols + c)
        end
    end
    imwrite(img, output_filename)
end

end # module
