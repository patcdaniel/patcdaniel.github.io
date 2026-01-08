import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"

interface PortraitOptions {
  imagePath: string
  alt?: string
  size?: string
}

export default ((opts?: PortraitOptions) => {
  const Portrait: QuartzComponent = ({ displayClass }: QuartzComponentProps) => {
    const imagePath = opts?.imagePath ?? "/content/images/portrait.png"
    const alt = opts?.alt ?? "Portrait"
    const size = opts?.size ?? "150px"

    return (
      <div class={`portrait ${displayClass ?? ""}`}>
        <img src={imagePath} alt={alt} />
        <style>{`
          .portrait {
            display: flex;
            justify-content: left;
            margin: 1rem 0;
          }
          .portrait img {
            width: ${size};
            height: ${size};
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid var(--gray);
          }
        `}</style>
      </div>
    )
  }

  Portrait.displayName = "Portrait"
  return Portrait
}) satisfies QuartzComponentConstructor